
// Add Equatable and CloudFirestore and Hive in Dependencies
// Added the Data Models
// Also in these models they have placed urls for images but we need to change them ki hum gallery se utha sake image or multiple images ho not a single image specifically product ki alag alag angles se hoti hai na
// Added multidex support for the app to run i am not commiting that if you want to run it do that plz refer to link below if you don't know the process
// https://stackoverflow.com/questions/26609734/how-to-enable-multidexing-with-the-new-android-multidex-support-library

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'models.dart';

class Clinic extends Equatable {
  final String id;
  final String name;
  final File imageFile;
  final String description;
  final List<Category> categories;
  final List<Product> products;
  final List<Service> services;
  final double deliveryFee;
  final double distance;
  final Place ?address;
  final bool isOpen;


  const Clinic({
    required this.id,
    required this.name,
    required this.description,
    required this.imageFile,
    required this.categories,
    required this.products,
    required this.services,
    this.address,
    this.deliveryFee = 10,
    this.distance = 15,
    required this.isOpen,
  });

  factory Clinic.fromSnapshot(DocumentSnapshot snap) {
    return Clinic(
      id: snap.id,
      name: snap['name'],
      imageFile: snap['imageFile'],
      description: snap['description'],
      categories: (snap['categories'] as List).map(
        (category) {
          return Category.fromSnapshot(category);
        },
      ).toList(),
      products: (snap['products'] as List).map(
        (product) {
          return Product.fromSnapshot(product);
        },
      ).toList(),
      address: Place.fromJson(snap['address']),
      isOpen: snap['isOpen'],
      services: (snap['services'] as List).map(
        (service) {
          return Service.fromSnapshot(service);
        },
      ).toList(),
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      imageFile,
      categories,
      products,
      deliveryFee,
      distance,
      isOpen,
      services,
    ];
  }
}