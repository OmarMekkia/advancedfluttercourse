import 'package:advancedfluttercourse/core/networking/api_error_handler.dart';
import 'package:advancedfluttercourse/core/networking/api_result.dart';
import 'package:advancedfluttercourse/core/networking/api_service.dart';
import 'package:advancedfluttercourse/features/login/data/models/login_request_body.dart';
import 'package:advancedfluttercourse/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService apiService;
  LoginRepo(this.apiService);
  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      // Handle the error and return a failure result
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
