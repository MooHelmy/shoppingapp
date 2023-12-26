import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_shop/constants.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/features/Cart/Data/repo/Cartrepo.dart';

class CartRepoIm extends CartRepo {
  CollectionReference cart =
      FirebaseFirestore.instance.collection(kProductCollection);
  @override
  void addToCart({required ProductModel model}) {
    cart.add({
      kProductname: model.title,
      kProductprice: model.price,
      kProductdescription: model.descriptions,
      kProductid: model.id,
      kProductimage: model.image
    });
  }

  @override
  void deleteFromCart(String id) {
    cart.doc(id).delete();
  }

  @override
  Future<List<ProductModel>> loadCartData() async {
    List<ProductModel> product = [];
    var snapshot = await cart.get();
    for (var doc in snapshot.docs) {
      var data = doc.data();
      String id = doc.id;
      product.add(ProductModel.fromJson(data, id));
    }
    return product;
  }
}
