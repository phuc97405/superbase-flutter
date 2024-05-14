import 'package:flutter/foundation.dart' show immutable;
import 'package:superbase_flutter/core/constants/app/string_constants.dart';

@immutable
class ValidateOperations {
  const ValidateOperations._();

  static normalValidation(
    dynamic value,
  ) {
    if (value == null || value.isEmpty) {
      return StringConstants.requiredField;
    }
    return null;
  }

  static nickNameValidation(
    dynamic value,
  ) {
    if (value == null || value.isEmpty || value.length < 2) {
      return StringConstants.limitNickName;
    } else {
      // if (value.length > 1 && value.length < 11) {
      //   return StringConstants.passNickName;
      // }
      if (value.length > 10) {
        return StringConstants.longNickName;
      }
    }
    return null;
  }
}
