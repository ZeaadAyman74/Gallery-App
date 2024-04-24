import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_gallery/core/utils/strings.dart';

class ErrorModel extends Equatable {
  const ErrorModel();

  String getErrorMessage(Object error, {List<String>? keys}) {
    if (error is DioException) {
      if (kDebugMode) {
        print(error.response);
      }
      if (error.response != null) {
        if (error.response!.data['message'] != null) {
          return error.response!.data['message'];
        } else {
          return AppStrings.errorMessage;
        }
      } else {
        return _DioExceptionErrors.getErrorMessage(error);
      }
    } else {
      if (kDebugMode) {
        print(error);
      }
      return AppStrings.errorMessage;
    }
  }

  @override
  List<Object?> get props => [];
}

class _DioExceptionErrors {
  static String getErrorMessage(DioException error) {
    if (error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.connectionError) {
      return AppStrings.checkInternet;
    } else {
      return AppStrings.errorMessage;
    }
  }
}
