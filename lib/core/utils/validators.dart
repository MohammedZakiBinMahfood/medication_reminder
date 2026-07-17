class Validators {
  Validators._();

  static String? requiredString(String? value, {String message = 'This field is required'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? requiredList<T>(List<T>? value, {String message = 'Please select at least one item'}) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? positiveNumber(String? value, {String message = 'Must be a positive number'}) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    final number = num.tryParse(value);
    if (number == null || number <= 0) {
      return message;
    }
    return null;
  }

  static String? timeRequired(String? value, {String message = 'Time is required'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    // Basic time format validation (HH:MM or hh:mm a) could be added here
    return null;
  }

  static String? dateRequired(DateTime? value, {String message = 'Date is required'}) {
    if (value == null) {
      return message;
    }
    return null;
  }
}
