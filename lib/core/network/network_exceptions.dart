
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sense_more/core/translations/locale_keys.g.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.invalidEmail() = InvalidEmail;

  const factory NetworkExceptions.userDisabled() = UserDisabled;

  const factory NetworkExceptions.userNotFound() = UserNotFound;

  const factory NetworkExceptions.wrongPassword() = WrongPassword;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions getFirebaseException(error) {
    if (error is FirebaseAuthException) {
      try {
        NetworkExceptions networkExceptions;
        switch (error.code) {
          case 'invalid-email': networkExceptions = const NetworkExceptions.invalidEmail(); //eMessage = 'البريد الإلكتروني المدخل غير صالح';
          break;
          case 'user-disabled': networkExceptions =  const NetworkExceptions.userDisabled();//eMessage = 'هذا الحساب معطل!\nبرجاء التواصل مع الدعم الفني اذا كنت تعتقد ان هناك خطأ ما';
          break;
          case 'user-not-found': networkExceptions =  const NetworkExceptions.userNotFound();//eMessage = 'هذا المستخدم غير موجود';
          break;
          case 'wrong-password': networkExceptions =  const NetworkExceptions.wrongPassword();//eMessage = 'كلمة المرور غير صالحة';
          break;
          default: networkExceptions = NetworkExceptions.defaultError(error.message??'Unknown Error');
        }
        return networkExceptions;
      } on FormatException catch (e) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(
        requestCancelled: () {
          errorMessage = LocaleKeys.request_cancelled.tr();
        },
        defaultError: (error) {
          errorMessage = error;
        },
        invalidEmail: () {
          errorMessage = 'Please enter a valid Email address';
        },
        userDisabled: () {
          errorMessage = 'This account is disabled.';
        },
        userNotFound: () {
          errorMessage = 'This user doesn\'t exist';
        },
        wrongPassword: () {
          errorMessage = 'Wrong password';
        },
        unableToProcess: () {
          errorMessage = LocaleKeys.unexpected_error_occurred.tr();
        },
        formatException: () {
          errorMessage = LocaleKeys.unknown_error.tr();
        },
        unexpectedError: () {
           errorMessage = LocaleKeys.unknown_error.tr();

        });
      return errorMessage;
  }
  // static String getErrorMessage(NetworkExceptions networkExceptions) {
  //   var errorMessage = "";

  //   networkExceptions.when(notImplemented: () {
  //     errorMessage = LocaleKeys.not_implemented.tr();
  //   }, requestCancelled: () {
  //     errorMessage = LocaleKeys.request_cancelled.tr();
  //   }, internalServerError: () {
  //     errorMessage = LocaleKeys.internal_server_error.tr();
  //   }, notFound: (String reason) {
  //     errorMessage = reason;
  //   }, serviceUnavailable: () {
  //     errorMessage = LocaleKeys.service_unavailable.tr();
  //   }, methodNotAllowed: () {
  //     errorMessage = LocaleKeys.unexpected_error_occurred.tr();
  //   }, badRequest: () {
  //     errorMessage = LocaleKeys.unexpected_error_occurred.tr();
  //   }, unauthorizedRequest: (String error) {
  //     errorMessage = error;
  //   }, unexpectedError: () {
  //     errorMessage = LocaleKeys.unknown_error.tr();
  //   }, requestTimeout: () {
  //     errorMessage = LocaleKeys.unexpected_error_occurred.tr();
  //   }, noInternetConnection: () {
  //     errorMessage = LocaleKeys.no_internet_connection.tr();
  //   }, conflict: () {
  //     errorMessage = LocaleKeys.error_due_to_conflict.tr();
  //   }, sendTimeout: () {
  //     errorMessage = LocaleKeys.send_timeout_in_connection_with_API_server.tr();
  //   }, unableToProcess: () {
  //     errorMessage = LocaleKeys.unexpected_error_occurred.tr();
  //   }, defaultError: (String error) {
  //     errorMessage = error;
  //   }, formatException: () {
  //     errorMessage = LocaleKeys.unknown_error.tr();
  //   }, notAcceptable: () {
  //     errorMessage = LocaleKeys.unexpected_error_occurred.tr();
  //   }, resetPasswordInvalidEmail: (String reason) {
  //     errorMessage = reason;
  //   }, emailIsAlreadyExists: () {
  //     errorMessage = LocaleKeys.email_already_exists.tr();
  //   });
  //   return errorMessage;
  // }
}
