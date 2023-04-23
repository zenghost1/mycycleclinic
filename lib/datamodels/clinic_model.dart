
// Add Equatable and CloudFirestore and Hive in Dependencies
// Added the Data Models
// I have picked the Clinic Data Modal from somewhere so we need to change mainly the deliveryFee part ig or atleast modify it
// Also in these models they have placed urls for images but we need to change them ki hum gallery se utha sake image or multiple images ho not a single image specifically product ki alag alag angles se hoti hai na
// Also product data modal mein size and color ka option bhi rakhna hai
// Added multidex support for the app to run i am not commiting that if you want to run it do that plz refer to link below if you don't know the process
// https://stackoverflow.com/questions/26609734/how-to-enable-multidexing-with-the-new-android-multidex-support-library

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'category_model.dart';
import 'opening_hours.dart';
import 'place_modal.dart';
import 'product_model.dart';

class Clinic extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final List<String> tags;
  final List<Category> categories;
  final List<Product> products;
  final List<OpeningHours> openingHours;
  final int deliveryTime;
  final String priceCategory;
  final double deliveryFee;
  final double distance;
  final Place ?address;


  const Clinic({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.tags,
    required this.categories,
    required this.products,
    required this.openingHours,
    this.address,
    this.deliveryTime = 10,
    this.priceCategory = '\$',
    this.deliveryFee = 10,
    this.distance = 15,
  });

  factory Clinic.fromSnapshot(DocumentSnapshot snap) {
    return Clinic(
      id: snap.id,
      name: snap['name'],
      imageUrl: snap['imageUrl'],
      description: snap['description'],
      tags: (snap['tags'] as List).map(
        (tag) {
          return tag as String;
        },
      ).toList(),
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
      openingHours: (snap['openingHours'] as List).map(
        (openingHour) {
          return OpeningHours.fromSnapshot(openingHour);
        },
      ).toList(),
      address: Place.fromJson(snap['address']),
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      imageUrl,
      tags,
      categories,
      products,
      openingHours,
      deliveryTime,
      priceCategory,
      deliveryFee,
      distance,
    ];
  }

  static List<Clinic> clinic =[
    Clinic(id: 'jwenfkwjenf', name: 'name', description: 'lowrfwe', imageUrl: 'https://www.istockphoto.com/photo/neon-rainbow-watercolor-banner-background-on-black-pure-neon-watercolor-colors-gm1370678625-440177652?utm_source=unsplash&utm_medium=affiliate&utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fsplash&utm_term=splash%3A%3A%3A', tags: ['wefwef', 'efr'], categories: [], products: [], openingHours: [], )
  ];
}