// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_registration_success.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelRegistrationSuccess _$ModelRegistrationSuccessFromJson(
        Map<String, dynamic> json) =>
    ModelRegistrationSuccess(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : ModelUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ModelRegistrationSuccessToJson(
        ModelRegistrationSuccess instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
