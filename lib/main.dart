import 'package:flutter/material.dart';
import 'core/di/service_locator.dart';
import 'features/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await setupServiceLocator();
  runApp(const MyApp());
}
