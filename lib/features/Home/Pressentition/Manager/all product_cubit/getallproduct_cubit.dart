import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/features/Home/data/repo/Homerepo.dart';

part 'getallproduct_state.dart';

class GetallproductCubit extends Cubit<GetallproductState> {
  GetallproductCubit(this.homerepo) : super(GetallproductInitial());
  final HomeRepo homerepo;
  Future<void> allproducts() async {
    emit(GetallproductLoading());
    var result = await homerepo.getallproduct();
    result.fold((failure) {
      emit(GetallproductFailuer(messageerror: failure.toString()));
    }, (product) {
      emit(GetallproductSuccsseful(product: product));
    });
  }
}
