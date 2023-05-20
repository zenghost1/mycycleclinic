part of 'address_bloc.dart';

@override
abstract class AddressEvent {}

class GetInput extends AddressEvent {
  String inputText;

  GetInput(this.inputText);
}