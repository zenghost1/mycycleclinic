part of 'address_bloc.dart';

abstract class AddressState extends Equatable{}

@immutable
class AddressInitial extends AddressState {
  String? inputText;

  AddressInitial({this.inputText});
  
  @override
  List<Object?> get props => [inputText];
}
