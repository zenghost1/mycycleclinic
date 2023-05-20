
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState>{
  AddressBloc() : super(AddressInitial());

  Stream<AddressState> mapEventToState(AddressEvent event) async* {
    if (event is GetInput) {
      yield* _mapGetInputEventToState(event);
    }
  }

  Stream<AddressState> _mapGetInputEventToState(GetInput event) async* {
    yield AddressInitial(inputText: event.inputText);
  }
}