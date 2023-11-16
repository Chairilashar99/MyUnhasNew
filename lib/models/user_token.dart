class UserTokenModel {
  final int expiresIn;
  final String accessToken;
  final String refreshToken;

  UserTokenModel({
    required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserTokenModel.fromJson(Map<String, dynamic> json) {
    return UserTokenModel(
      expiresIn: json['expires_in'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'expires_in': expiresIn,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }
}
