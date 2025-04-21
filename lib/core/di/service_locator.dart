import 'package:get_it/get_it.dart';
import 'package:kursol/core/network/dio_client.dart';
import 'package:kursol/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:kursol/features/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import 'package:kursol/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:kursol/features/auth/domain/repositories/auth_repository.dart';
import 'package:kursol/features/auth/domain/usecases/register_with_phone_usecase.dart';
import 'package:kursol/features/auth/presentation/bloc/sign_up_bloc.dart';

import '../../features/auth/domain/usecases/register_with_email_usecase.dart';
import '../common/textstyles/app_textstyles.dart';
import '../common/textstyles/urbanist_textstyles.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Core
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<AppTextStyles>(UrbanistTextStyles());
  sl.registerSingleton<UrbanistTextStyles>(UrbanistTextStyles());

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(dioClient: sl<DioClient>()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl<AuthRemoteDataSource>()));

  sl.registerLazySingleton<RegisterWithEmailUsecase>(
    () => RegisterWithEmailUsecase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<RegisterWithPhoneUseCase>(
    () => RegisterWithPhoneUseCase(sl<AuthRepository>()),
  );

  sl.registerFactory<SignupBloc>(
      () => SignupBloc(authRepository: sl<AuthRepository>()));
}
