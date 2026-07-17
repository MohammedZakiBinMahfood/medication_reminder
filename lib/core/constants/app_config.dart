class AppConfig {
  AppConfig._();

  // Field constraints
  static const int uuidLength = 36;
  static const int maxTitleLength = 100;
  static const int maxDescriptionLength = 500;

  // Pagination
  static const int defaultPageSize = 20;

  // Animations
  static const Duration fastAnimation = Duration(milliseconds: 150);
  static const Duration defaultAnimation = Duration(milliseconds: 300);

  // System constraints
  static const int maxNotificationsLimit = 64; // iOS local notifications limit
}
