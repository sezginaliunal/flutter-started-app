import 'package:fake_e_commerce/app/res/enums/text_editing_validate.dart';

extension TextEditingControllerErrorExtension on TextEditingControllerError {
  String get errorMessage {
    switch (this) {
      case TextEditingControllerError.INVALID_EMAIL:
        return 'Geçersiz email formatı.';
      case TextEditingControllerError.EMPTY_EMAIL:
        return 'Lütfen bir email girin.';
      case TextEditingControllerError.INVALID_PASSWORD:
        return 'Şifre en az 8 karakter olmalı ve en az bir büyük harf, bir küçük harf ve bir rakam içermelidir.';
      case TextEditingControllerError.EMPTY_PASSWORD:
        return 'Lütfen bir şifre girin.';
    }
  }
}
