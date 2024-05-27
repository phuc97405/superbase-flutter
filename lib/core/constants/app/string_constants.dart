import 'package:flutter/material.dart';
import 'package:superbase_flutter/core/constants/enums/language.enum.dart';

@immutable
class StringConstants {
  const StringConstants._();

  static const String appName = 'vivid';
  static const String nativeAppKey = 'ef7aa40f3ba836b8d82d7732802089ab';

  static const String fontFamily = 'Pretendard';

  /// for Login view
  static const String nickNameTitle = "닉네임 설정";
  static const String reNickNameTitle = "추천인 닉네임";

  static const String nickNameHint = '사용하실 닉네임을 설정해주세요.';
  static const String reNickNameHint = '추천인 닉네임을 입력해주세요.';

  static const String limitNickName = "⚠ 2글자 이상 입력해주세요.";
  static const String passNickName = "사용할 수 있는 닉네임이에요!";
  static const String longNickName = "닉네임 길이를 초과했어요!";

  static const String birthHint = 'xxxxxx/x';
  static const String nicknameHint = 'pista';

  static const String emailHint = 'example@gmail.com';

  /// for Home view
  static const String homePage = 'Home Page';

  /// for validators
  static const String requiredField = "Required field";
  static const String makeSureCorrectMail =
      "Please make sure you enter the correct email.";
}

const List<Locale> supportedLocales = [
  Locale(LanguageEnum.english, ''),
  Locale(LanguageEnum.vietnam, ''),
];

const Locale fallbackLocale = Locale(LanguageEnum.english, '');
