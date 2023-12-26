import 'package:product_shop/core/Models/Prodects_Model.dart';

abstract class OrderRepo {
  void addOrder(
      {required ProductModel model,
      required String address,
      required int amount});
  void deleteOrder(String id);
  Future<List<ProductModel>> loadOrdderData();
}
