import 'package:advancedfluttercourse/core/networking/api_service.dart';
import 'package:advancedfluttercourse/core/networking/dio_factory.dart';
import 'package:advancedfluttercourse/features/login/data/repos/login_repo.dart';
import 'package:advancedfluttercourse/features/login/logic/cubit/login_cubit.dart';
import 'package:advancedfluttercourse/features/signup/data/repos/signup_repo.dart';
import 'package:advancedfluttercourse/features/signup/logic/cubit/signup_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
