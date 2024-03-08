// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:spiderweb_assignment/core/constant.dart';
import 'package:spiderweb_assignment/domain/cart/model/model.dart';
import 'package:spiderweb_assignment/domain/cart/service_implementation/service.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<ProdctDataToCartEvent>((event, emit) {
      var item = productData[event.index];
      CartProductModel modelItem = CartProductModel(
          productId: item["shoeName"],
          brandName: item["brandName"],
          shoeName: item["shoeName"],
          description: item["description"],
          price: item["price"],
          image: item["image"],
          size: item["size"],
          count: 1);
      CartService.addOrDeleteFromCart(modelItem);
    });
    on<CheckProductInCartEvent>((event, emit) async {
      final cartBox = await Hive.openBox<CartProductModel>("cartproduct");
      List<CartProductModel> cartProductList = cartBox.values.toList();
      bool isExist = cartProductList
          .where((element) => element.shoeName == event.shoeName)
          .isNotEmpty;
      if (isExist) {
        emit(ProductAddedState());
      } else {
        emit(DetailInitial());
      }
    });
  }
}
