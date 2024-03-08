// ignore_for_file: must_be_immutable

part of 'detail_bloc.dart';

@immutable
sealed class DetailEvent {}

class ProdctDataToCartEvent extends DetailEvent {
  ProdctDataToCartEvent({required this.index});
  int index;
}

class CheckProductInCartEvent extends DetailEvent {
  CheckProductInCartEvent({required this.shoeName});
  String shoeName;
}
