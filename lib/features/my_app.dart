import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kursol/core/di/service_locator.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';
import 'package:kursol/features/auth/presentation/bloc/sign_up_bloc.dart';
import '../core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBloc>(create: (context) => sl<SignupBloc>())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        routerConfig: appRouter,
      ),
    );
  }
}
