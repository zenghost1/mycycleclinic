import 'dart:io';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String clinicId;
  final String name;
  final String category;
  final String description;
  final List<File> imageFile;
  final double price;
  final String size;
  final String color;

  const Product({
    required this.id,
    required this.clinicId,
    required this.name,
    required this.category,
    required this.description,
    required this.imageFile,
    required this.price,
    required this.size, 
    required this.color, 
  });

  factory Product.fromSnapshot(Map<String, dynamic> snap) {
    return Product(
      id: snap['id'].toString(),
      clinicId: snap['clinicId'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageFile: snap['imageFilr'],
      price: snap['price'], color: snap['color'], size: snap['size'],
    );
  }

  @override
  List<Object?> get props =>
      [id, clinicId, name, category, description, imageFile, price, color, size];
}