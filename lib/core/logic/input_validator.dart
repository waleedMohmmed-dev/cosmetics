class InputValidator {
  static String? phoneValidator(String? v) {
    if (v == null || v.isEmpty) {
      return 'pleas Enter your phone number';
    }
    if (v.length < 10) {
      return 'Pleas the number must be 10 number';
    }
    return null;
  }

  static String? passwordValidator(String? v) {
    if (v == null || v.isEmpty) {
      return 'Pleas Enter your password';
    }
    if (v.length < 6) {
      return 'Pleas the password must be 6 numbers';
    }
    return null;
  }

  static String? nameValidator(v) {
    if (v == null || v.isEmpty) {
      return 'Bro Please Enter Your Name';
    }
    return null;
  }

  static String? emailValidator(v) {
    if (v == null || v.isEmpty) {
      return 'Please Fill Your Email ya Bro';
    }

    if (v.length < 6) {
      return 'Please The Email Should be 6 Characters';
    }

    if (!v.endsWith('@gmail.com')) {
      return 'Email must end with @gmail.com';
    }

    return null;
  }
}
