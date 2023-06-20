import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mycycleclinic/datamodels/place_model.dart';
import 'package:mycycleclinic/datamodels/service_model.dart';

import 'category_model.dart';
import 'models.dart';

class Clinic extends Equatable {
  final String id;
  final String name;
  final File imageFile;
  final String description;
  //final List<Category> categories;
  final List<ShopData> products;
  final List<Service> services;
  final double deliveryFee;
  final double distance;
  final Place ?address;
  final bool isOpen;
  final String number;


  Clinic({
    required this.id,
    required this.name,
    required this.description,
    required this.imageFile,
    //required this.categories,
    required this.products,
    required this.services,
    this.address,
    this.deliveryFee = 10,
    this.distance = 15,
    required this.isOpen,
    required this.number
  });

  factory Clinic.fromSnapshot(DocumentSnapshot snap) {
    return Clinic(
      id: snap.id,
      name: snap['name'],
      imageFile: snap['imageFile'],
      description: snap['description'],
      // categories: (snap['categories'] as List).map(
      //   (category) {
      //     return Category.fromSnapshot(category);
      //   },
      // ).toList(),
    //   products: (snap['products'] as List).map(
    //     (product) {
    //       return ShopData.fromSnapshot(product);
    //     },
    //   ).toList(),
      address: Place.fromJson(snap['address']),
      isOpen: snap['isOpen'],
      services: (snap['services'] as List).map(
        (service) {
          return Service.fromSnapshot(service);
        },
      ).toList(), products: [],
      number: snap['number'],
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      imageFile,
      //categories,
      products,
      deliveryFee,
      distance,
      isOpen,
      services,
      number
    ];
  }
}