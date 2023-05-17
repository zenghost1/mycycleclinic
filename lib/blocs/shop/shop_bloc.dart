import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../datamodels/models.dart';
import '../../repositories/shop_data_repository.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopDataProvider shopDataProvider = ShopDataProvider();

  ShopBloc() : super(ShopInitial()) {
    on<ShopPageInitializedEvent>(_onShopPageInitialized);
    on<ItemAddingCartEvent>(_onItemAddingCart);
    on<ItemAddedCartEvent>(_onItemAddedCart);
    on<ItemDeleteCartEvent>(_onItemDeleteCart);
    add(ShopPageInitializedEvent());
  }

  FutureOr<void> _onShopPageInitialized(
      ShopPageInitializedEvent event, Emitter<ShopState> emit) async {
      ShopData shopData = await shopDataProvider.getShopItems();
      ShopData cartData = await shopDataProvider.geCartItems();
      emit(ShopPageLoadedState(shopData: shopData, cartData: cartData));
    
  }

  FutureOr<void> _onItemAddingCart(
      ItemAddingCartEvent event, Emitter<ShopState> emit) async {
      ShopData cartData = await shopDataProvider.geCartItems();
      emit(ItemAddingCartState(
          cartItems: event.cartItems, cartData: cartData));
    
  }

  void _onItemAddedCart(
      ItemAddedCartEvent event, Emitter<ShopState> emit) {
    emit(ItemAddedCartState(cartItems: event.cartItems));
  }

  void _onItemDeleteCart(
      ItemDeleteCartEvent event, Emitter<ShopState> emit) {
    emit(ItemDeletingCartState(cartItems: event.cartItems));
  }
}
// on<ShopPageInitializedEvent>((event, emit) async {
    //   ShopData shopData = await shopDataProvider.getShopItems();
    //   ShopData cartData = await shopDataProvider.geCartItems();
    //   emit(ShopPageLoadedState(shopData: shopData, cartData: cartData));
    // });
    // on<ItemAddingCartEvent>((event, emit) async {
    //   ShopData cartData = await shopDataProvider.geCartItems();
    //   emit(ItemAddingCartState(cartItems: event.cartItems, cartData: cartData));
    // },);
    // on<ItemAddedCartEvent>((event, emit) async {
    //   ShopData cartData = await shopDataProvider.geCartItems();
    //   emit(ItemAddingCartState(cartItems: event.cartItems, cartData: cartData));
    // },);
    // on<ItemDeleteCartEvent>((event, emit) {
    //   emit(ItemDeletingCartState(cartItems: event.cartItems));
    // },);