import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_shop/constants.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/features/favorite/data/reps/Favorite_Reop.dart';

class FavoriteRepoIm extends FavoriteRepo {
  CollectionReference favorite =
      FirebaseFirestore.instance.collection(kFavoiteCollection);

  @override
  void addItemfav({required ProductModel model}) {
    favorite.add({
      kProductname: model.title,
      kProductprice: model.price,
      kProductdescription: model.descriptions,
      kProductid: model.id,
      kProductimage: model.image
    });
  }

  @override
  void deleteitem({required String id}) {
    favorite.doc(id).delete();
  }

  @override
  Future<List<ProductModel>> getFavorite() async {
    List<ProductModel> product = [];
    var snapshot = await favorite.get();
    for (var doc in snapshot.docs) {
      var data = doc.data();
      String id = doc.id;
      product.add(ProductModel.fromJson(data, id));
    }
    return product;
  }
}
