// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelUser _$ModelUserFromJson(Map<String, dynamic> json) => ModelUser(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      createdAt: json['created_at'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$ModelUserToJson(ModelUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
