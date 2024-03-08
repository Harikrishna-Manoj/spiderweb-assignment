import 'package:hive/hive.dart';
import 'package:spiderweb_assignment/core/constant.dart';
import 'package:spiderweb_assignment/domain/cart/model/model.dart';

class CartService {
  static openDataBase() async {
    await Hive.openBox<CartProductModel>(cartBoxName);
  }

  static void addOrDeleteFromCart(CartProductModel productData) {
    final Box cartBox = Hive.box<CartProductModel>(cartBoxName);
    List<CartProductModel> cartDataList = [...cartBox.values];
    bool isNotExist = cartDataList
        .where((element) => element.shoeName == productData.shoeName)
        .isEmpty;
    if (isNotExist) {
      cartBox.add(productData);
    } else {
      print("allready exist${productData.shoeName}");
    }
  }

  static Future<List<CartProductModel>> fetchCartData() async {
    final Box cartBox = await Hive.openBox<CartProductModel>(cartBoxName);
    List<CartProductModel> cartDataList = [...cartBox.values];
    return cartDataList;
  }

  static deleteItem(String productId) async {
    final Box cartBox = await Hive.openBox<CartProductModel>(cartBoxName);
    List<CartProductModel> cartDataList = [...cartBox.values];
    int index =
        cartDataList.indexWhere((element) => element.productId! == productId);
    cartBox.deleteAt(index);
  }

  static Future<CartProductModel> fetchDataForUpdation(String productId) async {
    final Box cartBox = await Hive.openBox<CartProductModel>(cartBoxName);
    List<CartProductModel> cartDataList = [...cartBox.values];
    CartProductModel cartData =
        cartDataList.firstWhere((element) => element.productId == productId);
    return cartData;
  }

  static updateEmployeeData(CartProductModel cartProductModel) async {
    final Box cartBox = await Hive.openBox<CartProductModel>(cartBoxName);
    List<CartProductModel> cartDataList = [...cartBox.values];
    int index = cartDataList.indexWhere(
        (element) => element.productId == cartProductModel.productId);
    cartBox.putAt(index, cartProductModel);
  }
}
