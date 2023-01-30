import 'package:dio/dio.dart';
import 'package:ecommerce/features/home/data/datasources/api_datasources/categories_api.dart';
import 'package:ecommerce/features/home/domain/repositories/categorise_repositories.dart';
import 'package:ecommerce/features/home/domain/repositories/products_repositories.dart';
import 'package:ecommerce/features/home/domain/usercases/get_categorise_usercase.dart';
import 'package:ecommerce/features/home/presentation/bloc/catigories_bloc/bloc/categories_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/shared_preferences/cache_helper.dart';
import 'features/home/data/datasources/api_datasources/products_api.dart';
import 'features/home/data/datasources/local_datasorce/categories_local.dart';
import 'features/home/data/datasources/local_datasorce/products_local.dart';
import 'features/home/data/repositories/categories_impl.dart';
import 'features/home/data/repositories/products_repo_impl.dart';
import 'features/home/domain/usercases/get_products_usecase.dart';
import 'features/home/presentation/bloc/products_bloc/products_bloc_bloc.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //BLOC

  locator.registerFactory(() => ProductsBloc(locator()));
  locator
      .registerFactory(() => CategoriesBloc(getCategoriseUsercase: locator()));

  //USECASES
  locator.registerLazySingleton(() => GetProductsUsercase(locator()));
  locator.registerLazySingleton(
      () => GetCategoriseUsercase(categoriseRepositories: locator()));

  //CORE
  locator.registerLazySingleton(() => NetworkInfoImpl(locator()));

  //REPOSITORISE
  locator.registerLazySingleton<ProductsRepository>(() => ProductsRepoImpl(
      networkInfoImpl: locator(),
      productsLocalImpl: locator(),
      productsApiImpl: locator()));

  locator.registerLazySingleton<CategoriseRepository>(
      () => CaregoriesImpl(locator(), locator(), locator()));

  //DATASOURSE
  locator.registerLazySingleton(() => ProductsApiImpl());
  locator.registerLazySingleton(() => ProductsLocalImpl(locator()));
  locator.registerLazySingleton(() => CategoriesApiImpl());
  locator.registerLazySingleton(() => CategoriesLocalImpl(locator()));

  //locator.registerLazySingleton(() => CategoriesLo(locator()));

  //EXTRNAL
  locator.registerLazySingleton(() => SharedPreferences.getInstance());
  locator.registerLazySingleton(() => InternetConnectionChecker());
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => CacheHelper());
}
