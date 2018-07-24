import 'package:meta/meta.dart';

class Category{

  String id;
  String name;
  String items;

  Category({@required this.id,@required this.name, @required this.items});

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(id:json['id'],name:json['name'],items:json['items']);
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'name': name, 'items': items};
}