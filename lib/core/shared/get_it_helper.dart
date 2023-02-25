import 'package:get_it/get_it.dart';
import 'package:sense_more/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/business_logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:sense_more/business_logic/cubit/register_cubit/register_cubit.dart';
import 'package:sense_more/business_logic/cubit/search_cubit/search_cubit.dart';
import 'package:sense_more/core/shared/bluetooth_helper.dart';
import 'package:sense_more/data/models/user_model.dart';
import 'package:sense_more/data/repository/home_repository.dart';
import 'package:sense_more/data/repository/login_repositorey.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository());

  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepository>()));

  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit());

  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository());

  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt<HomeRepository>()));

  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit());

  getIt.registerLazySingleton<SearchCubit>(() => SearchCubit());

  getIt.registerSingleton<BluetoothHelper>(BluetoothHelper());

}