import 'package:wcars/data/data_source/carro/carro_remote_data_source.dart';
import 'package:wcars/domain/repositories/auth/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:wcars/data/local/shared_preferences.dart';
import 'package:wcars/domain/repositories/carro/carro_repository.dart';
import 'package:wcars/domain/usecases/carro/get_list_carros.use_case.dart';

import '../data/data_source/auth/auth_local_data_source.dart';
import '../data/data_source/auth/auth_remote_data_source.dart';
import '../data/remote/custom_dio.dart';
import '../data/remote/interceptors/auth_interceptor.dart';
import '../data/repositories/auth/auth_repository_impl.dart';
import '../data/repositories/carro/carro_repository_impl.dart';
import '../domain/usecases/auth/login.use_case.dart';
import '../domain/usecases/carro/adicionar_carro.use_case.dart';

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
  gh.factory<LoginUseCase>(() => LoginUseCase(get<AuthRepository>()));

  // Carros
  gh.factory<CarroRemoteDataSource>(
      () => CarroRemoteDataSource(get<CustomDio>()));
  gh.factory<GetListCarrosUseCase>(
      () => GetListCarrosUseCase(get<CarroRepository>()));
  gh.factory<AdcionarCarroUseCase>(
      () => AdcionarCarroUseCase(get<CarroRepository>()));

  gh.singleton<Dio>(dio);
  gh.singleton<SharedPreferencesManager>(SharedPreferencesManager());
  gh.singleton<CustomDio>(CustomDio(get<Dio>(), get<AuthInterceptor>()));

  gh.singleton<CarroRepository>(
      CarroRepositoryImpl(get<CarroRemoteDataSource>()));
  gh.singleton<AuthRepository>(AuthRepositoryImpl(
      get<AuthLocalDataSource>(), get<AuthRemoteDataSource>()));

  return get;
}
