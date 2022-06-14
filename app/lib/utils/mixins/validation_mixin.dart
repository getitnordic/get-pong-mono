abstract class ValidationMixin {
  String? validateEmail(String value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  String? validateNickname(String value) {
    if (value.length < 4 || value.length > 12) {
      return 'Nickname must be between 4 and 12 characters long';
    } else {
      return null;
    }
  }

  String? validateFirstName(String value) {
    if (value.length < 2) {
      return 'First name must have at least 2 characters';
    } else {
      return null;
    }
  }

  String? validateLastName(String value) {
    if (value.length < 2) {
      return 'Last name must have at least 2 characters';
    } else {
      return null;
    }
  }
}
