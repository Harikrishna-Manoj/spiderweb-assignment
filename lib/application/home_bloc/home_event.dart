// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class ProdctDataToCartEvent extends HomeEvent {
  ProdctDataToCartEvent({required this.index});
  int index;
}

class CheckProductInCartEvent extends HomeEvent {
  CheckProductInCartEvent({required this.shoeName});
  String shoeName;
}
