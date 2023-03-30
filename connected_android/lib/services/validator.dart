class Validator {
  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Ingrese un correo';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Ingrese un correo valido';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'Ingrese una contraseña';
    }

    return null;
  }

  static String? validateRegisterPassword({required String? password, required String? confirmPassword}) {
    if (password == null) {
      return null;
    }
    if (confirmPassword == null) {
      return null;
    }
    if (password!= confirmPassword) {
      return 'Las contraseñas no coinciden';
    }

    return null;
  }
}