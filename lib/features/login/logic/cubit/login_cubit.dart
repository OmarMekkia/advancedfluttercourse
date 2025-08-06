import 'package:advancedfluttercourse/core/networking/api_result.dart';
import 'package:advancedfluttercourse/features/login/data/models/login_request_body.dart';
import 'package:advancedfluttercourse/features/login/data/repos/login_repo.dart';
import 'package:advancedfluttercourse/features/login/logic/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure:(error){
        emit(LoginState.error(message: error.apiErrorModel.message??''));
      }
    );
  }
}
