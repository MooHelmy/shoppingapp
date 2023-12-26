import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_shop/constants.dart';
import 'package:product_shop/features/Profile/Data/model/Users_model.dart';
import 'package:product_shop/features/Profile/Data/repo/Profile_repo.dart';

class ProfileRepoim extends ProfileRepo {
  CollectionReference user = FirebaseFirestore.instance.collection(kuserinfo);

  @override
  Future<UserModel> loadUsertData() async {
    UserModel? users;
    var snapshot = await user.get();
    for (var doc in snapshot.docs) {
      var data = doc.data();
      String id = doc.id;
      users = UserModel.fromjson(data, id);
    }
    return users!;
  }

  @override
  Future<void> updateUserimage({required UserModel model, id, url}) async {
    await user.doc(id).update({
      kusernames: model.username,
      kuseremail: model.email,
      kuserpassword: model.passowrd,
      kuserurl: url
    });
  }
}
