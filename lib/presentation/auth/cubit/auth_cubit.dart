import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:superbase_flutter/core/constants/enums/auth_enums.dart';
import 'package:superbase_flutter/core/injection/injector_container.dart';
import 'package:superbase_flutter/data/models/payload/check_user_payload.dart';
import 'package:superbase_flutter/domain/usecases/check_user_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final checkUserUseCase = injector<CheckUserUseCase>();

  AuthCubit() : super(const AuthState.init());

  // on<AuthStarted>((event, emit) async {
  //     try {
  //       if (await authCacheManager.isLoggedIn()) {
  //         await authCacheManager.loadTokenFromStorage();
  //         String userId = await authCacheManager.getUserId();
  //         (await userAPI.getProfile(userId)).when(success: (data, _) async {
  //           emit(AuthState.authenticated(user: data));
  //         }, error: (type, message) async {
  //           emit(AuthState.authenticated(messError: message));
  //         });
  //       }
  //     } catch (e) {
  //       emit(const AuthState.authenticated(messError: 'AuthStarted Error'));
  //     }
  //   });

  void loginWithKaKao() async {
    try {
      emit(const AuthState.authenticated(status: AuthStatus.loading));
      bool talkInstalled = await isKakaoTalkInstalled();
      OAuthToken token = talkInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();
      await handleCallApiWithSocial(token.accessToken, 'KAKAO');
    } catch (e) {
      emit(const AuthState.authenticated(messError: 'Login KaKao Error'));
    }
  }

  Future handleCallApiWithSocial(
      // Emitter<AuthState> emit,
      String accessToken,
      String method) async {
    (await checkUserUseCase
            .call(CheckUserPayload(access_token: accessToken, method: method)))
        .when(success: (data, _) async {
      // emit(AuthState.authenticated(user: data));
      // await authCacheManager.updateLoggedIn(true);
      // await authCacheManager.updateTokenAndUserId(
      //     TokenEntities(
      //         accessToken: data?.user?.accessToken,
      //         refreshToken: data?.user?.refreshToken),
      //     data?.user?.id.toString());
    }, error: (type, message) async {
      if (message == '사용자가 존재하지 않습니다') {
        // emit(AuthState.authenticated(
        //     status: AuthStatus.notRegistered,
        //     accessToken: accessToken,
        //     method: method.name));
      } else {
        // emit(const AuthState.authenticated(
        //     messError: 'An error occurred, please try again'));
      }
    });
  }
}
