part of 'Order_products_cubit.dart';

@immutable
sealed class OrderProductsState {}

final class OrderProductsInitial extends OrderProductsState {}

final class OrderProductsLoading extends OrderProductsState {}

final class OrderProductsSuccssful extends OrderProductsState {
  final List<ProductModel> OrderProduct;

  OrderProductsSuccssful({required this.OrderProduct});
}

final class AddOrderProductsSuccssful extends OrderProductsState {}

final class DeleteOrderProductsSuccssful extends OrderProductsState {}

final class OrderProductsFailuer extends OrderProductsState {
  final String messageerror;

  OrderProductsFailuer({required this.messageerror});
}
