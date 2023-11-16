class AppValidation {
  bool isEmailValid(String email) {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegex.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    // Define your password criteria here
    final minLength = 6;
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    final hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    final hasDigit = RegExp(r'[0-9]').hasMatch(password);

    return password.length >= minLength &&
        hasUppercase &&
        hasLowercase &&
        hasDigit;
  }

  bool isFullnameValid(String name) {
    final RegExp nameRegex = RegExp(r"^[a-zA-Z-' ]+$");
    return nameRegex.hasMatch(name);
  }

  bool isValidMobile(String mobile){
    // Regular expression to match a common mobile number format
    final RegExp phoneRegex = RegExp(r"^\+?[0-9]{6,14}$");
    return phoneRegex.hasMatch(mobile);
  }
}
