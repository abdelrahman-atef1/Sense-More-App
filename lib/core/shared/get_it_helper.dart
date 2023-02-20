import 'package:get_it/get_it.dart';
import 'package:sense_more/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:sense_more/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:sense_more/business_logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:sense_more/core/shared/bluetooth_helper.dart';
import 'package:sense_more/data/repository/home_repository.dart';
import 'package:sense_more/data/repository/login_repositorey.dart';
import 'package:sense_more/main.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository());

  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepository>()));

  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository());

  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt<HomeRepository>()));

  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit());

  getIt.registerSingleton<BluetoothHelper>(BluetoothHelper());
}