import 'package:get/get.dart';

ValidatInp(String value, int min, int max, String Type) {
  if (Type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "Not Valid Username";
    }
  }

  if (Type == "Email") {
    if (!GetUtils.isEmail(value)) {
      return "Not Valid Email";
    }
  }
  if (Type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Not Valid Phone";
    }
  }

  if (value.isEmpty) {
    return "can't be Empty";
  }
  if (value.length < min) {
    return "can't be less than $min";
  }
  if (value.length > max) {
    return "can't be larger than $max";
  }
}
