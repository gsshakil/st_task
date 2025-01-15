// Package imports:
import 'package:equatable/equatable.dart';

class FailureType {
  static const int none = 0;
  static const int exception = 1;
  static const int networkUnavailable = 2;
  static const int networkError = 3;
  static const int httpStatus = 4;
  static const int invalidLoginCredentials = 5;
  static const int missingData = 6;
  static const int invalidQRCode = 7;
  static const int timeout = 8;
  static const int databaseUnavailable = 9;
  static const int consentRequired = 10;
  static const int oauthTokenExpired = 11;
  static const int ineligible = 12;
  static const int deviceDoesNotAllowControl = 13;
  static const int customMessage = 99;
}

sealed class Failure extends Equatable {
  final int failureType;

  const Failure(this.failureType);
}

class ExceptionFailure extends Failure {
  final Exception exception;
  final dynamic additionalData;

  const ExceptionFailure({required this.exception, this.additionalData}) : super(FailureType.exception);

  @override
  List<Object?> get props => [exception, additionalData];
}

class GeneralFailure extends Failure {
  final dynamic additionalData;

  const GeneralFailure({required int failureType, this.additionalData}) : super(failureType);

  const GeneralFailure.networkUnavailable() : this(failureType: FailureType.networkUnavailable);

  const GeneralFailure.networkError() : this(failureType: FailureType.networkError);

  const GeneralFailure.missingData(dynamic additionalData)
      : this(failureType: FailureType.missingData, additionalData: additionalData);

  const GeneralFailure.invalidLoginCredentials() : this(failureType: FailureType.invalidLoginCredentials);

  GeneralFailure.httpStatus(int code, String api)
      : this(failureType: FailureType.httpStatus, additionalData: <String, dynamic>{'code': code, 'api': api});

  const GeneralFailure.consentRequired() : this(failureType: FailureType.consentRequired);

  const GeneralFailure.invalidQRCode() : this(failureType: FailureType.invalidQRCode);

  const GeneralFailure.timeout() : this(failureType: FailureType.timeout);

  const GeneralFailure.databaseUnavailable() : this(failureType: FailureType.databaseUnavailable);

  const GeneralFailure.oauthTokenExpired() : this(failureType: FailureType.oauthTokenExpired);

  const GeneralFailure.ineligible() : this(failureType: FailureType.ineligible);

  const GeneralFailure.deviceDoesNotAllowControl() : this(failureType: FailureType.deviceDoesNotAllowControl);

  const GeneralFailure.custom(String message) : this(failureType: FailureType.customMessage, additionalData: message);

  const GeneralFailure.none() : this(failureType: FailureType.none);

  int? get httpStatusCode {
    if (failureType == FailureType.httpStatus && additionalData is Map<String, dynamic>) {
      return additionalData['code'] as int?;
    }
    return null;
  }

  @override
  List<Object?> get props => [failureType, additionalData];
}
