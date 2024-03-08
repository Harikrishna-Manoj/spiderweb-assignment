// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class ProductLoadedState extends CartState {
  ProductLoadedState(
      {required this.cartModelDataList, required this.totlePrice});
  List<CartProductModel> cartModelDataList;
  int totlePrice;
}
