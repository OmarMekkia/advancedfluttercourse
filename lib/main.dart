import 'package:advancedfluttercourse/core/di/dependency_injection.dart';
import 'package:advancedfluttercourse/core/routing/app_router.dart';
import 'package:advancedfluttercourse/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(DocApp(appRouter: AppRouter.router));
}
