import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'version_checker.dart';
import 'version_check_result.dart';

final versionCheckerProvider = Provider<VersionChecker>((ref) {
  return VersionChecker();
});

final updateCheckProvider = FutureProvider.autoDispose<VersionCheckResult>((
  ref,
) async {
  final checker = ref.read(versionCheckerProvider);
  return checker.checkForUpdate();
});
