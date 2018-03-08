import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {

  final String name;
  final int age;

  User({@required this.name,@required this.age});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}