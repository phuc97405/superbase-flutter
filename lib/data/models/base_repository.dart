import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:superbase_flutter/core/common/error_type.dart';
import 'package:superbase_flutter/core/common/result.dart';
import 'package:superbase_flutter/core/networking/model_base_response.dart';

typedef EntityToModelMapper<Entity, Data> = Data? Function(Entity? entity);
typedef SaveResult<Data> = Future Function(Data? data, [Meta? meta]);

abstract class BaseRepository {
  // Future<Result<Data>> safeDbCall<Entity, Data>(Future<Entity?> callDb,
  //     {required EntityToModelMapper<Entity, Data> mapperDb}) async {
  //   try {
  //     final response = await callDb;
  //     if (response != null) {
  //       logger.d("DB success message -> $response");
  //       return Success(mapperDb.call(response)!);
  //     } else {
  //       logger.d("DB response is null");
  //       return Error(ErrorType.GENERIC, "DB response is null!");
  //     }
  //   } catch (exception) {
  //     logger.d("DB failure message -> $exception");
  //     return Error(ErrorType.GENERIC, "Unknown DB error");
  //   }
  // }

  Future<Result<Data>> baseApiRepository<Data>(
    Future<ModelBaseResponse<Data>> call, {
    SaveResult<Data?>? saveResult,
  }) async {
    try {
      var response = await call;
      if (response.isSuccess()) {
        await saveResult?.call(response.data, response.meta);
        return Success(
          response.data,
        );
      } else if (response.isFirstLoginSNS()) {
        // logger.d('isFirstLoginSNS');
        return Error(
            ErrorType.FIRST_LOGIN_SNS, response.message ?? "Unknown Error");
      } else if (response.isTokenExpired()) {
        return Error(
            ErrorType.TOKEN_EXPIRED, response.message ?? "Unknown Error");
      } else {
        return Error(ErrorType.GENERIC, response.message ?? "Unknown Error");
      }
    } on Exception catch (exception) {
      if (kDebugMode) {
        print("Api error message -> ${exception.toString()}");
      }
      if (exception is DioException) {
        switch (exception.type) {
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.badCertificate:
          case DioExceptionType.badResponse:
          case DioExceptionType.cancel:
            return Error(ErrorType.POOR_NETWORK, exception.message!);
          case DioExceptionType.connectionError:
            return Error(ErrorType.NO_NETWORK, exception.message!);
          case DioExceptionType.unknown:
            return Error(ErrorType.GENERIC, exception.message!);
        }
      }
      return Error(ErrorType.GENERIC, "Unknown API error$exception");
    }
  }

  // Future<Result<Data>> safeApiCallAuth<Data>(
  //   Future<ModelBaseResponse<Data>> call, {
  //   SaveResult<Data>? saveResult,
  // }) async {
  //   try {
  //     var response = await call;
  //     // logger.d('response$response');
  //     if (response.isSuccess()) {
  //       await saveResult?.call(response.data);
  //       return Success(response.data, null);
  //     } else if (response.isFirstLoginSNS()) {
  //       // logger.d('isFirstLoginSNS');
  //       return Error(
  //           ErrorType.FIRST_LOGIN_SNS, response.message ?? "Unknown Error");
  //     } else if (response.isTokenExpired()) {
  //       return Error(
  //           ErrorType.TOKEN_EXPIRED, response.message ?? "Unknown Error");
  //     } else {
  //       return Error(ErrorType.GENERIC, response.message ?? "Unknown Error");
  //     }
  //   } on Exception catch (exception) {
  //     if (exception is DioException) {
  //       switch (exception.type) {
  //         case DioExceptionType.sendTimeout:
  //         case DioExceptionType.receiveTimeout:
  //         case DioExceptionType.connectionTimeout:
  //         case DioExceptionType.badCertificate:
  //         case DioExceptionType.badResponse:
  //         case DioExceptionType.cancel:
  //           return Error(ErrorType.POOR_NETWORK, exception.message!);
  //         case DioExceptionType.connectionError:
  //           return Error(ErrorType.NO_NETWORK, exception.message!);
  //         case DioExceptionType.unknown:
  //           return Error(ErrorType.GENERIC, exception.message!);
  //       }
  //     }
  //     return Error(ErrorType.GENERIC, "Unknown API error$exception");
  //   }
  // }
}
