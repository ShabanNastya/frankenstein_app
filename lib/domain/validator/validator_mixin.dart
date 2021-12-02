mixin ValidatorMixin {
  bool validateEmail(String? value) {
    if(value!=null) {
      return value.isNotEmpty &&
          RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value);
    }
    return false;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty || value.length < 8) {
      return 'Please enter a valid password';
    } else {
      return null;
    }
  }
}
