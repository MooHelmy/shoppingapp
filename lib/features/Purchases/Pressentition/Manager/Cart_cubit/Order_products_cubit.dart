import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/features/Purchases/Data/repo/Orderrepo.dart';

part 'Order_products_state.dart';

class OrderProductsCubit extends Cubit<OrderProductsState> {
  OrderProductsCubit(this.orderRepo) : super(OrderProductsInitial());
  final OrderRepo orderRepo;
  void addOrder(
      {required ProductModel model,
      required String? addres,
      required int? amount}) {
    emit(OrderProductsLoading());
    try {
      orderRepo.addOrder(model: model, address: addres!, amount: amount!);
      emit(AddOrderProductsSuccssful());
    } on Exception catch (e) {
      emit(OrderProductsFailuer(messageerror: e.toString()));
    }
  }

  Future<void> loadDataOrder() async {
    emit(OrderProductsLoading());
    try {
      List<ProductModel> product;
      product = await orderRepo.loadOrdderData();
      emit(OrderProductsSuccssful(OrderProduct: product));
    } on Exception catch (e) {
      emit(OrderProductsFailuer(messageerror: e.toString()));
    }
  }

  void deleteOrder(String id) {
    emit(OrderProductsLoading());
    try {
      orderRepo.deleteOrder(id);
      emit(DeleteOrderProductsSuccssful());
    } on Exception catch (e) {
      emit(OrderProductsFailuer(messageerror: e.toString()));
    }
  }
}
