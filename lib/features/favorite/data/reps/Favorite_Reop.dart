import 'package:product_shop/core/Models/Prodects_Model.dart';

abstract class FavoriteRepo {
  void addItemfav({required ProductModel model});
  void deleteitem({required String id});
  Future<List<ProductModel>> getFavorite();
}
