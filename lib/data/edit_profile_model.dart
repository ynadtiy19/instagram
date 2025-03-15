class EditProfileModel {
  String name;
  String username;
  String? website;
  String? bio;
  String? email;
  String? phone;
  String? gender;

  EditProfileModel({
    required this.name,
    required this.username,
    required this.website,
    required this.bio,
    required this.email,
    required this.phone,
    required this.gender,
  });

  // تحويل JSON إلى كائن (Factory Constructor)
  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      website: json['website'] ?? '',
      bio: json['bio'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
    );
  }

  // تحويل كائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'website': website,
      'bio': bio,
      'email': email,
      'phone': phone,
      'gender': gender,
    };
  }
}
