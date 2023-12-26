part of 'getallproduct_cubit.dart';

@immutable
sealed class GetallproductState {}

final class GetallproductInitial extends GetallproductState {}

final class GetallproductLoading extends GetallproductState {}

final class GetallproductSuccsseful extends GetallproductState {
  final List<ProductModel> product;

  GetallproductSuccsseful({required this.product});
}

final class GetallproductFailuer extends GetallproductState {
  final String messageerror;

  GetallproductFailuer({required this.messageerror});
}
