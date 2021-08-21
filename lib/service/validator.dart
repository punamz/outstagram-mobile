abstract class StringValidator {
  bool isValid(String value);
}

class EmailValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value);
  }
}

class PasswordValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}