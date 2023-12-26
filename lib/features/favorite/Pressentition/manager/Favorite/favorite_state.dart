part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoritProductsInitial extends FavoriteState {}

final class FavoritProductsLoading extends FavoriteState {}

final class FavoritProductsSuccssful extends FavoriteState {
  final List<ProductModel> favoriteProduct;

  FavoritProductsSuccssful({required this.favoriteProduct});
}

final class AddFavoritProductsSuccssful extends FavoriteState {}

final class DeleteFavoritProductsSuccssful extends FavoriteState {}

final class FavoritProductsFailuer extends FavoriteState {
  final String messageerror;

  FavoritProductsFailuer({required this.messageerror});
}
