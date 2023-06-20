import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final String id;
  final String service_name;
  final String description;
  final double price;
  final String type;

  Service({
    required this.id,
    required this.service_name,
    required this.description,
    required this.price,
    required this.type,
  });

  @override
  List<Object?> get props => [id, service_name, description, price];

  factory Service.fromSnapshot(Map<String, dynamic> snap) {
    return Service(
      id: snap['id'].toString(),
      service_name: snap['service_name'],
      description: snap['description'],
      price: snap['price'],
      type: snap['type'],
    );
  }

  static List<Service> categories = [
    Service(
      id: '1',
      service_name: 'Safety',
      description: 'This is a test description',
      price: 55.01,
      type: 'home_pickup'
    ),
    Service(
      id: '2',
      service_name: 'General',
      description:'This is a test description',
      price: 55.01,
      type: 'store_drop'
    ),
    Service(
      id: '3',
      service_name: 'Overhaul',
      description: 'This is a test description',
      price: 55.01,
      type: 'home_pickup'
    ),
  ];
}