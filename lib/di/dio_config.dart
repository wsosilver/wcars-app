import 'package:wcars/domain/repositories/auth/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:wcars/data/local/shared_preferences.dart';

import '../data/data_source/auth/auth_local_data_source.dart';
import '../data/data_source/auth/auth_remote_data_source.dart';
import '../data/data_source/user/user_remote_data_source.dart';
import '../data/remote/custom_dio.dart';
import '../data/remote/interceptors/auth_interceptor.dart';
import '../data/repositories/user/user_repository_impl.dart';
import '../domain/repositories/user/user_repository.dart';
import '../domain/usecases/user/login.use_case.dart';

Future<GetIt> initGetIt(GetIt get) async {
  WidgetsFlutterBinding.ensureInitialized();
  final gh = GetItHelper(get);
  final dio = Dio();

  // Auth
  gh.factory<AuthInterceptor>(() => AuthInterceptor(get<Dio>()));
  gh.factory<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(get<CustomDio>()));
  gh.factory<AuthLocalDataSource>(
      () => AuthLocalDataSource(get<SharedPreferencesManager>()));

  // User
  gh.factory<UserRemoteDataSource>(
      () => UserRemoteDataSource(get<CustomDio>()));
  gh.factory<LoginUseCase>(() => LoginUseCase(get<AuthRepository>()));

  gh.singleton<Dio>(dio);
  gh.singleton<SharedPreferencesManager>(SharedPreferencesManager());
  gh.singleton<CustomDio>(CustomDio(get<Dio>(), get<AuthInterceptor>()));

  gh.singleton<UserRepository>(UserRepositoryImpl(get<UserRemoteDataSource>()));

  return get;
}
