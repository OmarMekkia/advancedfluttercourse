import 'package:advancedfluttercourse/core/di/dependency_injection.dart';
import 'package:advancedfluttercourse/core/routing/app_router.dart';
import 'package:advancedfluttercourse/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };
  runApp(DocApp(appRouter: AppRouter.router));
}
