import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'version_check_result.dart';

class VersionChecker {
  static const _packageName = 'com.example.medication_reminder';
  static const _playStoreUrl =
      'https://play.google.com/store/apps/details?id=$_packageName&hl=en&gl=US';

  static const _headers = {
    'User-Agent':
        'Mozilla/5.0 (Linux; Android 14; Pixel 8) AppleWebKit/537.36 '
        '(KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36',
    'Accept-Language': 'en-US,en;q=0.9',
  };

  Future<VersionCheckResult> checkForUpdate() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;

      final response = await http
          .get(Uri.parse(_playStoreUrl), headers: _headers)
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 404) {
        return VersionCheckResult.error(
          currentVersion: currentVersion,
          errorMessage: 'not_published',
        );
      }

      if (response.statusCode != 200) {
        return VersionCheckResult.error(
          currentVersion: currentVersion,
          errorMessage: 'HTTP ${response.statusCode}',
        );
      }

      final latestVersion = _parseVersion(response.body);

      if (latestVersion == null) {
        return VersionCheckResult.error(
          currentVersion: currentVersion,
          errorMessage: 'Could not parse version',
        );
      }

      return VersionCheckResult(
        currentVersion: currentVersion,
        latestVersion: latestVersion,
        hasUpdate: _isNewer(latestVersion, currentVersion),
      );
    } on TimeoutException {
      return VersionCheckResult.error(
        currentVersion: '',
        errorMessage: 'timeout',
      );
    } catch (e) {
      final packageInfo = await PackageInfo.fromPlatform();
      return VersionCheckResult.error(
        currentVersion: packageInfo.version,
        errorMessage: e.toString(),
      );
    }
  }

  String? _parseVersion(String html) {
    // Play Store embeds app data in AF_initDataCallback script blocks.
    // The app's own version string appears as a plain semver string
    // inside the ds:10 block's nested array data, e.g. "1.2.3"
    final dsBlockPattern = RegExp(
      r"AF_initDataCallback\(\{key:\s*'ds:\d+'[^}]*data:(.*?)\}\);",
      dotAll: true,
    );

    for (final match in dsBlockPattern.allMatches(html)) {
      final block = match.group(1);
      if (block == null) continue;

      // The app version is a standalone "x.y.z" string (not part of a URL)
      // inside the ds data. Look for it near the app's package name context.
      final versionPattern = RegExp(r'"(\d+\.\d+\.\d+)"');
      final versionMatches = versionPattern.allMatches(block);

      // The first standalone semver in the app detail block is the version
      for (final vMatch in versionMatches) {
        final version = vMatch.group(1)!;
        // Skip versions that look like they belong to screenshots/metadata
        // (these are typically 4-part like "2.26.16.72" for WhatsApp)
        // A real app version is usually x.y.z or x.y
        final parts = version.split('.');
        if (parts.length >= 2 && parts.length <= 4) {
          return version;
        }
      }
    }

    // Fallback: search entire page for any semver that could be the version
    // Take the first one found (Play Store puts the app's own version first
    // in the detail data)
    final fallbackPattern = RegExp(r'"(\d+\.\d+\.\d+)"');
    final firstMatch = fallbackPattern.firstMatch(html);
    return firstMatch?.group(1);
  }

  bool _isNewer(String latest, String current) {
    final latestParts = latest.split('.').map(int.tryParse).toList();
    final currentParts = current.split('.').map(int.tryParse).toList();

    final maxLen = latestParts.length > currentParts.length
        ? latestParts.length
        : currentParts.length;

    for (var i = 0; i < maxLen; i++) {
      final l = i < latestParts.length ? (latestParts[i] ?? 0) : 0;
      final c = i < currentParts.length ? (currentParts[i] ?? 0) : 0;
      if (l > c) return true;
      if (l < c) return false;
    }
    return false;
  }
}
