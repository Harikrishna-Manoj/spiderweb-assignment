import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:spiderweb_assignment/domain/cart/model/model.dart';
import 'package:spiderweb_assignment/domain/cart/service_implementation/service.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<LoadProdctEvent>((event, emit) async {
      int totalPrice = 0;
      List<CartProductModel> cartModelDataList =
          await CartService.fetchCartData();
      for (var i = 0; i < cartModelDataList.length; i++) {
        totalPrice += cartModelDataList[i].price! * cartModelDataList[i].count!;
      }
      emit(ProductLoadedState(
          cartModelDataList: cartModelDataList, totlePrice: totalPrice));
    });
    on<UpdateProductCount>((event, emit) async {
      final Box cartBox = await Hive.openBox<CartProductModel>("cartproduct");
      List<CartProductModel> cartDataList = [...cartBox.values];
      CartProductModel cartData =
          cartDataList.firstWhere((element) => element.productId == event.id);
      if (event.isIncrement) {
        cartData.count = cartData.count! + 1;
      } else {
        if (cartData.count != 1) {
          cartData.count = cartData.count! - 1;
        }
      }
      int index = cartDataList
          .indexWhere((element) => element.productId == cartData.productId);
      cartBox.putAt(index, cartData);
    });

    on<DeleteProductEvent>((event, emit) {
      CartService.deleteItem(event.id);
      add(LoadProdctEvent());
    });
  }
}
