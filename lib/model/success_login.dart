import 'package:integra_mobile/model/model_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'success_login.g.dart';

@JsonSerializable()
class ModelSuccessLogin {
  ModelSuccessLogin({
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType,
  });

  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'token_type')
  final String tokenType;
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  ModelUser? user;

  factory ModelSuccessLogin.fromJson(Map<String, dynamic> json) =>
      _$ModelSuccessLoginFromJson(json);

  Map<String, dynamic> toJson() => _$ModelSuccessLoginToJson(this);
}
