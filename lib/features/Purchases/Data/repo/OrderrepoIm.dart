import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_shop/constants.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/features/Purchases/Data/repo/Orderrepo.dart';

class OrderRepoIm extends OrderRepo {
  CollectionReference orders =
      FirebaseFirestore.instance.collection(kOrderCollection);
  @override
  void addOrder(
      {required ProductModel model,
      required String address,
      required int amount}) {
    orders.add({
      kProductname: model.title,
      kProductprice: model.price,
      kProductdescription: model.descriptions,
      kProductid: model.id,
      kProductimage: model.image,
      korderTime: DateTime.now().toString(),
      korderamount: amount,
      kuserAddress: address,
    });
  }

  @override
  void deleteOrder(String id) {
    orders.doc(id).delete();
  }

  @override
  Future<List<ProductModel>> loadOrdderData() async {
    List<ProductModel> product = [];
    var snapshot = await orders.get();
    for (var doc in snapshot.docs) {
      var data = doc.data();
      String id = doc.id;
      product.add(ProductModel.fromJson(
        data,
        id,
      ));
    }
    return product;
  }
}
