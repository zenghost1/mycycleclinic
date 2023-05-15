import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl
  });

  @override
  List<Object?> get props => [id, name, description, imageUrl];

  factory Category.fromSnapshot(Map<String, dynamic> snap) {
    return Category(
      id: snap['id'].toString(),
      name: snap['name'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
    );
  }

  static List<Category> categories = [
    Category(
      id: '1',
      name: 'Services',
      description: 'This is a test description',
      imageUrl: 'assets/juice.png',
    ),
    Category(
      id: '2',
      name: 'Cycles',
      description:'This is a test description',
      imageUrl: 'assets/pizza.png',
    ),
    Category(
      id: '3',
      name: 'Tyres',
      description: 'This is a test description',
      imageUrl: 'assets/burger.png',
    ),
    Category(
      id: '4',
      name: 'Seats',
      description: 'This is a test description',
      imageUrl: 'assets/pancake.png',
    ),
    Category(
      id: '5',
      name: 'Horns',
      description: 'This is a test description',
      imageUrl: 'assets/avocado.png',
    ),
  ];
}