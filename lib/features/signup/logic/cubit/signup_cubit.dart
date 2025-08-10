import 'package:advancedfluttercourse/core/networking/api_result.dart';
import 'package:advancedfluttercourse/features/signup/data/models/signup_request_body.dart';
import 'package:advancedfluttercourse/features/signup/data/repos/signup_repo.dart';
import 'package:advancedfluttercourse/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  SignupCubit(this._signupRepo) : super(SignupState.initial());

  void emitSignUpState() async {
    emit(SignupState.loading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        gender: 0,
        phone: phoneController.text,
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );
    response.when(
      success: (signupResponse) {
        emit(SignupState.success(signupResponse));
      },
      failure: (error) {
        final allErrors = error.apiErrorModel.errorData?.values
            .whereType<List>()
            .expand((e) => e)
            .map((e) => e.toString())
            .toList();
        final String errorString = (allErrors!=null && allErrors.isNotEmpty)
      ? allErrors.join('\n')
      : 'Unknown Error';

        emit(SignupState.error(errorString));
      },
    );
  }
}
