import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  Future<dynamic> getproduct({required String url}) async {
    var result = await dio.get(url);
    return result.data;
  }
}
