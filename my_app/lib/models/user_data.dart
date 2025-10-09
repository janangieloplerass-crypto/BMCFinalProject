class UserData {
  final String name;
  final String email;
  final String phone;
  final String gender;
  UserData({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });
  Map<String, String> toMap() {
    return {
      'Name': name,
      'Email': email,
      'Phone': phone,
      'Gender': gender,
    };
  }

  factory UserData.fromControllers({
    required String name,
    required String email,
    required String phone,
    required String gender,
  }) {
    return UserData(
      name: name,
      email: email,
      phone: phone,
      gender: gender,
    );
  }
}