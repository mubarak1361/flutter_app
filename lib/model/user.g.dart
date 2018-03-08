// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) =>
    new User(name: json['name'] as String, age: json['age'] as int);

abstract class _$UserSerializerMixin {
  String get name;
  int get age;
  Map<String, dynamic> toJson() => <String, dynamic>{'name': name, 'age': age};
}
