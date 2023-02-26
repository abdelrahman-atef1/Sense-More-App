part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success(User user) = _Success;
  const factory HomeState.bluetoothSearch(ScanResult nearestDevice) = _BluetoothSearch;
  const factory HomeState.bluetoothDummySearch(ScanResultModel nearestDevice) = _BluetoothDummySearch;
  const factory HomeState.error(Object error) = _Error;
}
