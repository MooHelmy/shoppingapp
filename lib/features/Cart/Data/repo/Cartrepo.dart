import 'package:product_shop/core/Models/Prodects_Model.dart';

abstract class CartRepo {
  void addToCart({required ProductModel model});
  void deleteFromCart(String id);
  Future<List<ProductModel>> loadCartData();
}
