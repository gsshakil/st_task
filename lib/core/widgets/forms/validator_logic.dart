class ValidatorLogic {
  ValidatorLogic._();

  static String? requiredField(String? text,
      {String fieldName = 'This field'}) {
    if (text != null && text.isNotEmpty) {
      return null;
    } else {
      return "$fieldName is required";
    }
  }

  static String? requiredNumber(String? text,
      {String fieldName = 'This field'}) {
    if (text != null && text.isNotEmpty) {
      final isNumber = double.tryParse(text) != null;
      if (isNumber) {
        return null;
      } else {
        return 'Please enter a number';
      }
    } else {
      return "$fieldName is required";
    }
  }

  static String? requiredPassword(String? text) {
    if (text != null && text.isNotEmpty) {
      final valid = text.length >= 6;
      if (valid) {
        return null;
      } else {
        return 'Password length should be minimum 6';
      }
    } else {
      return "Password is required";
    }
  }

  static String? requiredInteger(String? text,
      {String fieldName = 'This field'}) {
    if (text != null && text.isNotEmpty) {
      final isNumber = int.tryParse(text) != null;
      if (isNumber) {
        return null;
      } else {
        return 'Please enter a number';
      }
    } else {
      return "$fieldName is required";
    }
  }

  static String? requiredEmail(String? text) {
    if (text != null && text.isNotEmpty) {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(text);
      if (emailValid) {
        return null;
      } else {
        return 'Please enter a valid email address';
      }
    } else {
      return "Email is required";
    }
  }
}
