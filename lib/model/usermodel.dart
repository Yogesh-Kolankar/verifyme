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
