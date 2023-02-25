import 'network_base_model.dart';
import 'network_exceptions.dart';
import 'network_result.dart';

abstract class ResponseHandler {
  NetworkResult<T> handleResponse<T>(NetworkBaseModel<T> response) {
    if (response.code == 200 || response.code == 201) {
      return NetworkResult.success(response.data);
    } else {
      return NetworkResult.failure(NetworkExceptions.getFirebaseException(response));
    }
  }
}
