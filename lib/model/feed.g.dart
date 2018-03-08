// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) => new Feed(
    items: (json['feed'] as List)
        ?.map((e) =>
            e == null ? null : new Item.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$FeedSerializerMixin {
  List<Item> get items;
  Map<String, dynamic> toJson() => <String, dynamic>{'feed': items};
}

Item _$ItemFromJson(Map<String, dynamic> json) => new Item(
    logo: json['profilePic'] as String,
    title: json['name'] as String,
    subTitle: json['status'] as String);

abstract class _$ItemSerializerMixin {
  String get logo;
  String get title;
  String get subTitle;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'profilePic': logo, 'name': title, 'status': subTitle};
}
