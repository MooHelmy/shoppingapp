import 'package:product_shop/features/Profile/Data/model/Users_model.dart';

abstract class ProfileRepo {
  Future<UserModel> loadUsertData();
  void updateUserimage({required UserModel model, id, url});
}
