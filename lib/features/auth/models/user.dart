import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      {required String id,
      required String username,
      @JsonKey(name: "first_name") required String firstName,
      @JsonKey(name: "last_name") required String lastName,
      String? institute}) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
