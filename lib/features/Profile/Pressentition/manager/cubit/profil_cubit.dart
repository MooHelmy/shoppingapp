import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_shop/features/Profile/Data/model/Users_model.dart';
import 'package:product_shop/features/Profile/Data/repo/Profile_repo.dart';

part 'profil_state.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilCubit(this.profileRepo) : super(ProfilInitial());
  final ProfileRepo profileRepo;
  Future<void> loadUsertData() async {
    emit(ProfilLoding());
    try {
      UserModel user;
      user = await profileRepo.loadUsertData();
      ProfilSuccssful(user: user);
    } on Exception catch (e) {
      ProfilFailuer(message: e.toString());
    }
  }
}
