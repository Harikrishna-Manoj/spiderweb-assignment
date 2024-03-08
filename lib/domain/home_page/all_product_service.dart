import 'package:hive/hive.dart';
import 'package:spiderweb_assignment/core/constant.dart';
import 'package:spiderweb_assignment/domain/cart/model/model.dart';

class HomePageService {
  static openDataBase() async {
    await Hive.openBox<CartProductModel>(cartBoxName);
  }

  static bool checkProductExistance(String id) {
    final Box<CartProductModel> cartBox =
        Hive.box<CartProductModel>(cartBoxName);
    List<CartProductModel> cartProductList = cartBox.values.toList();
    bool isExist =
        cartProductList.where((element) => element.shoeName == id).isNotEmpty;
    return isExist;
  }
}

class CartBox {
  static Box<CartProductModel>? _box;
  static Box<CartProductModel> getInstance() {
    return _box ??= Hive.box(cartBoxName);
  }
}
