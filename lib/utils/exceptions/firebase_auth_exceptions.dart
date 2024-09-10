///Custom exception class to handle various firebase authentication-related errors.
class ZFirebaseAuthException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  ZFirebaseAuthException(this.code);

  /// Get the corresponding  error message based on the error code.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered, Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid, Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak, Please choose a strong password.';
      case 'user-disabled':
        return 'This user account has been disabled, Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details, User not found.';
      case 'wrong-password':
        return 'Incorrect password, Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code, Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID, Please enter a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded, Please try again later.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication, Please login again.';
      case 'credential-already-in-use':
        return 'Thia credential is already associated with a different user account.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';
      case 'accounts-exist-with-different-credential':
        return 'An account already exists with the same email but different sign-in credential';
      case 'operation-not-allowed':
        return 'This operation is not allowed, Contact support for assistance.';
      case 'expired-action-code':
        return 'The action mode has expired, Please request a new action code.';
      case 'invalid-action-code':
        return 'The action code is invalid, Please check the code and try again';
      case 'missing-action-code':
        return 'The action code is missing, Please provide a valid action code';
      case 'user-token-expired':
        return 'The user\'s token has expired and authentication is expired, Please sign in again';
      case 'user-not-found':
        return 'No user found for the given email or UID';
      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'wrong-password':
        return 'The password is invalid, Please check your password and try again.';
      case 'user-token-revoked':
        return 'The user\'s token has been revoked. Please sign in again.';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please provide a valid recipient email.';
      case 'invalid-recipient email':
        return 'The recipient email is invalid. Please provide a valid recipient email.';
      case 'missing-iframe-start':
        return 'The email template is missing the iframe start tag.';
      case 'missing-iframe-end':
        return 'The email template is missing the iframe end tag.';
      case 'missing-iframe-src':
        return 'The email template is missing the iframe src attribute.';
      case 'auth-domain-config-required':
        return 'The authDomain configuration is required for the action code verification link.';
      case 'missing-app-credential':
        return 'The app credential is invalid. Please provide a valid app credential.';
      case 'invalid-app-credential':
        return 'The app credential is invalid. Please provide a valid app credential.';
      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';
      case 'uip-already-exists':
        return 'The provided user ID is already in use by another user.';
      case 'invalid-cordova-configuration':
        return 'The provided Cordova configuration is invalid.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}