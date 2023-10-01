abstract class Validators {
  static String? string({required String value, required String message}) {
    return value.isNotEmpty ? null : message;
  }

  static String removeSymbols(String value) {
    return value.replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  static String? empty(String? value) {
    if (value == null || value.isEmpty) {
      return "Campo em branco";
    }

    return null;
  }

  static String? password(String? password) {
    if (password == null || password.isEmpty) {
      return "Senha em branco";
    }

    if (password.length < 6) {
      return "Mínimo 6 caracteres";
    }

    return null;
  }
}
