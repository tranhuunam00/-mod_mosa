class Register {
  final String firstName;
  final String lastName;
  String? gender;
  String? dob;
  String? nationality;
  final String email;
  final String phone;
  final String password;

  Register({
    this.gender,
    this.dob,
    this.nationality,
    required this.phone,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phone,
        'dob': dob,
        'gender': gender,
        'password': password,
        'nationality': nationality,
      };
}
