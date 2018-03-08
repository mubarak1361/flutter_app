import 'package:json_annotation/json_annotation.dart';
part 'feed.g.dart';

//Command for generate files
//flutter packages pub run build_runner build

@JsonSerializable()
class Feed extends Object with _$FeedSerializerMixin {
  @JsonKey(name: 'feed')
  List<Item> items;

  Feed({this.items});

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}

@JsonSerializable()
class Item extends Object with _$ItemSerializerMixin {
  @JsonKey(name: 'profilePic')
  String logo;
  @JsonKey(name: 'name')
  String title;
  @JsonKey(name: 'status')
  String subTitle;

  Item({this.logo, this.title, this.subTitle});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
