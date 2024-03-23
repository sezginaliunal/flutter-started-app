import 'package:started_app/app/res/enums/text_editing_validate.dart';
import 'package:started_app/app/res/extensions/text_editing_validate.dart';

class TextEditingControllerUtils {
  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return TextEditingControllerError.EMPTY_EMAIL.errorMessage;
    } else if (!isValidEmail(value)) {
      return TextEditingControllerError.INVALID_EMAIL.errorMessage;
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return TextEditingControllerError.EMPTY_PASSWORD.errorMessage;
    } else if (!isValidPassword(value)) {
      return TextEditingControllerError.INVALID_PASSWORD.errorMessage;
    }
    return null;
  }

   String? emptyInputValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return TextEditingControllerError.EMPTY_INPUT.errorMessage;
    }
    return null;
  }

  bool isValidEmail(String email) {
    // Basit bir email doğrulama örneği
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isValidPassword(String password) {
    // Şifrenin minimum 8 karakter, en az bir büyük harf, bir küçük harf ve bir rakam içermesi gerektiğini doğrula
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        .hasMatch(password);
  }
}
