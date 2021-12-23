import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isPopular;
  final bool isRecommended;

  const Product(
      {required this.name,
      required this.category,
      required this.imageUrl,
      required this.price,
      required this.isRecommended,
      required this.isPopular});
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular']);
    return product;
  }

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isPopular, isRecommended];

  static List<Product> products = [
    Product(
        name: 'Pendant',
        category: 'ＣＨＡＩＮＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1576511306125-d962936f022f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
        price: 500,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Sneaker',
        category: 'ＳＨＯＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1603808033176-9d134e6f2c74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80',
        price: 900,
        isRecommended: false,
        isPopular: true),
    Product(
        name: 'OHoodie',
        category: 'ＨＯＯＤＩＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1601063476271-a159c71ab0b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=326&q=80',
        price: 700,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Vans',
        category: 'ＳＨＯＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=398&q=80',
        price: 600,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'H-Watch',
        category: 'ＷＡＴＣＨＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1628608569034-e214532ddfde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        price: 2000,
        isRecommended: false,
        isPopular: true),
    Product(
        name: 'NIKE-AF',
        category: 'ＳＨＯＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1606890542241-b848582fe5cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
        price: 1200,
        isRecommended: false,
        isPopular: true),
    Product(
        name: 'Chain',
        category: 'ＣＨＡＩＮＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1612473078636-e0d74e318ba7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
        price: 400,
        isRecommended: false,
        isPopular: true),
    Product(
        name: 'Tissot',
        category: 'ＷＡＴＣＨＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1522312346375-d1a52e2b99b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=394&q=80',
        price: 1500,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Hoodie',
        category: 'ＨＯＯＤＩＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1517942420142-6a296f9ee4b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        price: 1200,
        isRecommended: false,
        isPopular: true),
    Product(
        name: 'X-Chain',
        category: 'ＣＨＡＩＮＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1598369685657-71e64f65686c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80',
        price: 1200,
        isRecommended: true,
        isPopular: false),
    Product(
        name: 'Casio',
        category: 'ＷＡＴＣＨＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1587466412525-87497b34fc88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80',
        price: 1200,
        isRecommended: false,
        isPopular: false),
    Product(
        name: 'XHoodie',
        category: 'ＨＯＯＤＩＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1513789181297-6f2ec112c0bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80',
        price: 1200,
        isRecommended: false,
        isPopular: false),
    Product(
        name: 'Adidas',
        category: 'ＳＨＯＥＳ',
        imageUrl:
            'https://images.unsplash.com/photo-1578760803125-7f9f9937c3e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        price: 1200,
        isRecommended: false,
        isPopular: false),
  ];
}
