import 'package:pbh_project/models/type_of_Item.dart';

class ItemsForSearch {
  String title;
  int iD;
  String description;
  TypeOfItem types;

  ItemsForSearch({
    required this.title,
    required this.iD,
    required this.description,
    required this.types,
  });

  factory ItemsForSearch.fromJson(Map<String, dynamic> json) {
    String title = json['name'] ?? json['title'] ?? '';
    int iD = json['book_Id'] ?? json['id'] ?? '';
    String description = json['description'] ?? json['bio'] ?? '';
    TypeOfItem types =
        (json['id'] != null) ? TypeOfItem.writter : TypeOfItem.book;

    return ItemsForSearch(
      title: title,
      iD: iD,
      description: description,
      types: types,
    );
  }
}
