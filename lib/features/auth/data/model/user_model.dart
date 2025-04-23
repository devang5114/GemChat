class UserModel {
  final String userId;
  final String userName;
  final String userProfile;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userProfile,
  });

  // Factory method to create a UserModel from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userProfile: json['userProfile'] as String,
    );
  }

  // Method to convert a UserModel to a JSON map
  Map<String, dynamic> toJson() {
    return {'userId': userId, 'userName': userName, 'userProfile': userProfile};
  }
}
