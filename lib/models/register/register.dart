class Register {
  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final String email;
  final String phone;
  final String password;

  Register({
    required this.gender,
    required this.dob,
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
      };
}

class RegisterCustomerOther {
  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final String phone;

  RegisterCustomerOther({
    required this.gender,
    required this.dob,
    required this.phone,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phone,
        'dob': dob,
        'gender': gender,
        'other': true
      };
}
