import 'package:breake/constants/string.dart';
import 'package:dio/dio.dart';

class QuoteWebServices {
  late Dio dio;

  QuoteWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: qoatBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20), // 20 Sec
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllQuotes() async {
    try {
      Response response = await dio.get('quotes');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
