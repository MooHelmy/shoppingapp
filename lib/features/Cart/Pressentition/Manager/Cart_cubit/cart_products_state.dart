part of 'cart_products_cubit.dart';

@immutable
sealed class CartProductsState {}

final class CartProductsInitial extends CartProductsState {}

final class CartProductsLoading extends CartProductsState {}

final class CartProductsSuccssful extends CartProductsState {
  final List<ProductModel> cartProduct;

  CartProductsSuccssful({required this.cartProduct});
}

final class AddCartProductsSuccssful extends CartProductsState {}

final class DeleteCartProductsSuccssful extends CartProductsState {}

final class CartProductsFailuer extends CartProductsState {
  final String messageerror;

  CartProductsFailuer({required this.messageerror});
}
