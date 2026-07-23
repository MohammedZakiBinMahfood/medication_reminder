class VersionCheckResult {
  final String currentVersion;
  final String latestVersion;
  final bool hasUpdate;
  final String? errorMessage;

  const VersionCheckResult({
    required this.currentVersion,
    required this.latestVersion,
    required this.hasUpdate,
    this.errorMessage,
  });

  const VersionCheckResult.error({
    required this.currentVersion,
    required this.errorMessage,
  })  : latestVersion = '',
        hasUpdate = false;
}
