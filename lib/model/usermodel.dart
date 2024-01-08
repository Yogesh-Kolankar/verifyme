class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;

  UserModel({
    this.uid,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.confirmPassword,
  });

  //Data from the server

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword
    };
  }
}

/* 


  postDetailsToFirestore(
      email, firstName, lastName, password, confirmPassword) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModel userModel = UserModel();
    userModel.uid = user!.uid;
    userModel.email = user.email;
    userModel.firstName = firstName.text;
    userModel.lastName = lastName.text;
    userModel.password = password.text;
    userModel.confirmPassword = confirmPassword.text;
    await firebaseFirestore
        .collection("allUsers")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfuly");
    print("aaa::${userModel.toMap()}");
  }


*/