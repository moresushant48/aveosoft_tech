import 'package:get/get_utils/get_utils.dart';

class Validators {
  static String? validateStreet(String? value) {
    return value!.isEmpty ? "Please enter Street Name" : null;
  }

  static String? validateName(String? value) {
    return value!.isEmpty
        ? "Please enter a Name"
        : GetUtils.isAlphabetOnly(value.trim())
            ? null
            : "Not a valid name";
  }

  static String? validatePincode(String? value) {
    return value!.isEmpty
        ? "Please enter a Pincode"
        : GetUtils.isLengthEqualTo(value, 6)
            ? null
            : "Not a valid Pincode";
  }

  static String? validateEmail(String? value) {
    return value!.isEmpty
        ? "Please enter an Email"
        : GetUtils.isEmail(value)
            ? null
            : "Not a valid email";
  }

  static String? validatePassword(String? value) {
    return value!.isEmpty
        ? "Please enter a Password"
        : GetUtils.isLengthBetween(value, 6, 12)
            ? null
            : "Password should be between 6 to 12 characters.";
  }

  static String? validatePhoneNo(String? value) {
    return value!.isEmpty
        ? "Please enter a Phone Number"
        : GetUtils.isLengthEqualTo(value, 10)
            ? null
            : "Enter a valid Phone Number";
  }
}
