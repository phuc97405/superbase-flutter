import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:superbase_flutter/core/injection/injector_container.dart';

import 'cache_manager.dart';

@singleton
class AuthCacheManager {
  // Future<bool> isFirstEntry() async {
  //   return !(await CacheManager.getBool(NetworkEnums.introOff.path) ?? false);
  // }

  Future<bool> isLoggedIn() async {
    return (await CacheManager.getBool('login')) ?? false;
  }

  Future<void> signOut() async {
    await CacheManager.clearAll();
    // navigationService.pushAndRemoveUntil(
    //   const BottomTabs(),
    //   predicate: (route) => false,
    // );
  }

  // Future<void> updateFirstEntry() async {
  //   await CacheManager.setBool(NetworkEnums.introOff.path, true);
  // }

  Future<String> getUserId() async {
    if (await CacheManager.containsKey('userId')) {
      return (await CacheManager.getString('userId')) ?? '';
    }
    return '';
  }

  Future<String> getToken([bool isRefresh = false]) async {
    if (await CacheManager.containsKey('token')) {
      final getToken = await CacheManager.getString('token');
      // final TokenEntities tokenParse =
      //     TokenEntities.fromJson(jsonDecode(getToken.toString()));
      // if (isRefresh) {
      //   return tokenParse.refreshToken ?? '';
      // }
      // return tokenParse.accessToken ?? '';
    }
    return '';
  }

  Future<void> updateLoggedIn(bool isLoggedIn) async {
    await CacheManager.setBool('login', isLoggedIn);
  }

  // Future<void> updateTokenAndUserId(
  //     TokenEntities? token, String? userId) async {
  //   final dioManager = injector<Dio>();

  //   if (token != null && userId != null) {
  //     await CacheManager.setString('token', jsonEncode(token));
  //     await CacheManager.setString('userId', (userId));
  //     dioManager
  //         .options
  //         // ignore: collection_methods_unrelated_type
  //         .headers[(MapEntry('Authorization', 'token ${token.accessToken}'))];
  //   } else {
  //     if (await CacheManager.containsKey('token') ||
  //         await CacheManager.containsKey('userId')) {
  //       await CacheManager.remove('token');
  //       await CacheManager.remove('userId');
  //       dioManager.options.headers.clear();
  //     }
  //   }
  // }

  Future<void> loadTokenFromStorage() async {
    final dioManager = injector<Dio>();
    // logger.d('Loading token from storage');
    if (await CacheManager.containsKey('token')) {
      final getToken = await CacheManager.getString('token');
      // final TokenEntities tokenParse =
      //     TokenEntities.fromJson(jsonDecode(getToken.toString()));
      if (getToken!.isNotEmpty) {
        // print(tokenParse.accessToken ?? '');
        // dioManager.options.headers[
        // ignore: collection_methods_unrelated_type
        // (MapEntry('Authorization', 'token ${tokenParse.accessToken}'))];
      }
    }
  }
}
