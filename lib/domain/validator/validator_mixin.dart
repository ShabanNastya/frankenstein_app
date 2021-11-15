mixin ValidatorMixin {
  String? validateEmail(String? value) {
    if (value!.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return 'Please enter a valid e-mail';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty || value.length < 8) {
      return 'Please enter a valid password';
    } else {
      return null;
    }
  }
}
