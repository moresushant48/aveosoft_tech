class UserModel {
  String uid = "";
  String fName = "";
  String lName = "";
  String city = "";
  String email = "";
  String phone = "";
  String pincode = "";
  String street = "";

  UserModel();

  // UserModel  ({
  //   required this.uid,
  //   required this.fName,
  //   required this.lName,
  //   required this.city,
  //   required this.email,
  //   required this.phone,
  //   required this.pincode,
  //   required this.street,
  // });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fName': fName,
      'lName': lName,
      'city': city,
      'email': email,
      'phone': phone,
      'pincode': pincode,
      'street': street,
    };
  }
}
