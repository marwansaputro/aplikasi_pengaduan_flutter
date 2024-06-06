// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelSuccessLogin _$ModelSuccessLoginFromJson(Map<String, dynamic> json) =>
    ModelSuccessLogin(
      accessToken: json['access_token'] as String,
      expiresIn: json['expires_in'] as String,
      tokenType: json['token_type'] as String,
    )..user = json['user'] == null
        ? null
        : ModelUser.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$ModelSuccessLoginToJson(ModelSuccessLogin instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'user': instance.user,
    };
