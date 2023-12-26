import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/features/Cart/Data/repo/Cartrepo.dart';

part 'cart_products_state.dart';

class CartProductsCubit extends Cubit<CartProductsState> {
  CartProductsCubit(this.cartRepo) : super(CartProductsInitial());
  final CartRepo cartRepo;
  void addtoCart({required ProductModel model}) {
    emit(CartProductsLoading());
    try {
      cartRepo.addToCart(model: model);
      emit(AddCartProductsSuccssful());
    } on Exception catch (e) {
      emit(CartProductsFailuer(messageerror: e.toString()));
    }
  }

  Future<void> loadDataCart() async {
    emit(CartProductsLoading());
    try {
      List<ProductModel> product;
      product = await cartRepo.loadCartData();
      emit(CartProductsSuccssful(cartProduct: product));
    } on Exception catch (e) {
      emit(CartProductsFailuer(messageerror: e.toString()));
    }
  }

  void deletefromCart(String id) {
    emit(CartProductsLoading());
    try {
      cartRepo.deleteFromCart(id);
      emit(DeleteCartProductsSuccssful());
    } on Exception catch (e) {
      emit(CartProductsFailuer(messageerror: e.toString()));
    }
  }
}
