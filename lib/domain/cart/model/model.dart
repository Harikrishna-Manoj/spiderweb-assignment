import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class CartProductModel {
  @HiveField(0)
  String? productId;

  @HiveField(1)
  String? brandName;

  @HiveField(2)
  String? shoeName;

  @HiveField(3)
  String? description;

  @HiveField(4)
  int? price;

  @HiveField(5)
  String? image;

  @HiveField(6)
  String? size;

  @HiveField(7, defaultValue: 1)
  int? count;

  CartProductModel(
      {this.productId,
      this.brandName,
      this.shoeName,
      this.description,
      this.price,
      this.image,
      this.size,
      this.count});
}
