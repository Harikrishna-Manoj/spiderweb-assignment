// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class LoadProdctEvent extends CartEvent {}

class UpdateProductCount extends CartEvent {
  UpdateProductCount(
      {required this.count, required this.id, required this.isIncrement});
  int count;
  String id;
  bool isIncrement;
}

class DeleteProductEvent extends CartEvent {
  DeleteProductEvent({required this.id});
  String id;
}
