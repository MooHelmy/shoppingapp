import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/core/errors/failure.dart';
import 'package:product_shop/core/utils/api_service.dart';
import 'package:product_shop/features/Home/data/repo/Homerepo.dart';

class HomeRepoim extends HomeRepo {
  @override
  Future<Either<Failure, List<ProductModel>>> getallproduct() async {
    try {
      String url = 'https://fakestoreapi.com/products';
      List<dynamic> data = await ApiService().getproduct(url: url);
      List<ProductModel> product = [];
      for (var m in data) {
        product.add(ProductModel.fromJson(m));
      }
      return right(product);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromDioerror(e));
      }
      return left(ServerFailuer(e.toString()));
    }
  }
}
