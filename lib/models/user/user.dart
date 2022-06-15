class ProfileUser {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? avatarUrl;
  String? id;
  String? nationality;
  String? gender;
  String? dob;

  ProfileUser({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.avatarUrl,
    this.dob,
    this.gender,
    this.nationality,
  });

  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
        id: json['_id'] ?? '',
        firstName: json['firstName'] ?? '',
        lastName: json['lastName'] ?? '',
        email: json['email'] ?? '',
        phone: json['phoneNumber'] ?? '',
        avatarUrl: json['avatarUrl'] ??
            'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
        dob: json['dob'] ?? '',
        gender: json['gender'] ?? '',
        nationality: json['nationality'] ?? '');
  }

  Map<String, String> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'dob': dob!,
        'gender': gender!,
        // 'nationality': nationality!,
      };
}
