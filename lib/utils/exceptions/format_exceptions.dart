/// Custom exception class to handle various format-related errors.
class ZFormatException implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const ZFormatException([this.message = 'An unexpected format error occurred. Please check your input.']);

  /// Create a format exception from a specific error message.
  factory ZFormatException.fromMessage(String message) {
    return ZFormatException(message);
  }

  /// Get the corresponding error message.
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory ZFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const ZFormatException('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const ZFormatException('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const ZFormatException('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const ZFormatException('The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const ZFormatException('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const ZFormatException('The numeric format is invalid. Please enter a valid numeric format');
      default:
        return const ZFormatException('An unexpected error occurred. Please try again.');
    }
  }
}