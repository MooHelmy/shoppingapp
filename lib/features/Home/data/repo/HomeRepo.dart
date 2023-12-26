import 'package:dartz/dartz.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getallproduct();
}
