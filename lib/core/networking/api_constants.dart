
class ApiConstants {
  static const String baseUrl = 'https://vcare.integration25.com/api/';
  static const String loginEndpoint = 'auth/login';
  static const String registerEndpoint = 'auth/register';
  static const String fetchUserProfileEndpoint = 'user/profile';
  static const String updateUserProfileEndpoint = 'user/update';

  // Add more constants as needed
}

class ApiErrors {
  static const String badRequestError = 'badRequestError';
  static const String unauthorizedError = 'unauthorizedError';
  static const String forbiddenError = 'forbiddenError';
  static const String notFoundError = 'notFoundError';
  static const String internalServerError = 'internalServerError';
  static const String timeoutError = 'timeoutError';
  static const String unknownError = 'unknownError';
  static const String noInternetConnectionError = 'noInternetConnectionError';
  static const String conflictError = 'conflictError';
  static const String noContent = 'noContentError';
  static const String defaultError = 'defaultError';
  static const String cacheError = 'cacheError';
  static const String loadingMessage = 'loading_message';
  static const String retryAgainMessage = 'retry_again_message';
  static const String ok = 'ok';

  // Add more error constants as needed
}
