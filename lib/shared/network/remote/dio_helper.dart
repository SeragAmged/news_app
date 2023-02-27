import 'package:dio/dio.dart';

import '../../components/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> get({
   required String category,
   String country = 'eg'
  }) async =>
      await dio.get(
         "v2/top-headlines/",
        queryParameters:  {
          'country': country,
          'category': category,
          'apikey': apikey,
        },
      );
}
