import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    Category(
        name: 'ＣＨＡＩＮＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1612473078534-d1544ac44381?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
    Category(
        name: 'ＷＡＴＣＨＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1508057198894-247b23fe5ade?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
    Category(
        name: 'ＨＯＯＤＩＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1509942774463-acf339cf87d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
    Category(
        name: 'ＳＨＯＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1530&q=80')
  ];

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
