import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/features/favorite/data/reps/Favorite_Reop.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());
  final FavoriteRepo favoriteRepo;
  void addItemfav({required ProductModel model}) {
    emit(FavoritProductsLoading());
    try {
      favoriteRepo.addItemfav(model: model);
      emit(AddFavoritProductsSuccssful());
    } on Exception catch (e) {
      emit(FavoritProductsFailuer(messageerror: e.toString()));
    }
  }

  Future<void> getFavorite() async {
    emit(FavoritProductsLoading());
    try {
      List<ProductModel> product;
      product = await favoriteRepo.getFavorite();
      emit(FavoritProductsSuccssful(
        favoriteProduct: product,
      ));
    } on Exception catch (e) {
      emit(FavoritProductsFailuer(messageerror: e.toString()));
    }
  }

  void deleteitem(String id) {
    emit(FavoritProductsLoading());
    try {
      favoriteRepo.deleteitem(id: id);
      emit(DeleteFavoritProductsSuccssful());
    } on Exception catch (e) {
      emit(FavoritProductsFailuer(messageerror: e.toString()));
    }
  }
}
