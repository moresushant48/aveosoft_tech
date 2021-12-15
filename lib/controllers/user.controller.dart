import 'package:aveosoft_tech/model/user.model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final userModel = UserModel().obs;

  updateUser(String uid, String fName, String lName, String city, String email,
      String phone, String pincode, String street) {
    userModel.update((val) {
      val!.uid = uid;
      val.fName = fName;
      val.lName = lName;
      val.city = city;
      val.email = email;
      val.phone = phone;
      val.pincode = pincode;
      val.street = street;
    });
  }
}
