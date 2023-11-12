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
    String country = 'us',
  }) async {
    return await dio.get(
      "v2/top-headlines/",
      queryParameters: {
        'country': country,
        'category': category,
        'apikey': apikey,
      },
    );
  }

  static Future<Response> getSearch({required String value}) async =>
      await dio.get(
        "v2/everything/",
        queryParameters: {
          'q': value,
          'apikey': apikey,
        },
      );
}
