class Validators {
  static String? fieldEmpty(String? value) {
    return (value == null || value.isEmpty) ? "Campo Obrigatório" : null;
  }

  static String? email(String? value) {
    final RegExp emailRegExp =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (value == null || value.isEmpty) return "Campo Obrigatório";

    return !emailRegExp.hasMatch(value) ? 'Email inválido' : null;
  }
}
