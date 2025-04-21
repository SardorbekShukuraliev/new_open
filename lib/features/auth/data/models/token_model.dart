import 'package:kursol/features/auth/domain/entities/token_entity.dart';

class TokenModel {
  final String accessToken;
  final String refreshToken;
  final DateTime? accessTokenExpiry;
  final DateTime? refreshTokenExpiry;

  const TokenModel({
    required this.accessToken,
    required this.refreshToken,
    this.accessTokenExpiry,
    this.refreshTokenExpiry,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      accessTokenExpiry: json['access_token_expiry'] != null
          ? DateTime.parse(json['access_token_expiry'] as String)
          : null,
      refreshTokenExpiry: json['refresh_token_expiry'] != null
          ? DateTime.parse(json['refresh_token_expiry'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'access_token_expiry': accessTokenExpiry?.toIso8601String(),
      'refresh_token_expiry': refreshTokenExpiry?.toIso8601String(),
    };
  }

  TokenEntity toEntity() {
    return TokenEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessTokenExpiry: accessTokenExpiry,
      refreshTokenExpiry: refreshTokenExpiry,
    );
  }

  factory TokenModel.fromEntity(TokenEntity entity) {
    return TokenModel(
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
      accessTokenExpiry: entity.accessTokenExpiry,
      refreshTokenExpiry: entity.refreshTokenExpiry,
    );
  }
}
