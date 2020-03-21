import 'dart:convert';
import 'package:dio/dio.dart';

class NetWork {
  Dio dio = Dio();

  String baseUrl = 'https://five-starsupplies.com/api';

  Future<dynamic> getData({String url, Map<String, dynamic> headers}) async {
    var jsonResponse;
    dio.options.baseUrl = baseUrl;


    if (headers != null) dio.options.headers = headers;

    Response response = await dio.get('/$url').catchError((err) {});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      jsonResponse = json.decode(response.toString());
      return jsonResponse;
    } else if (response == null) {
      return response;
    } else {
      return response;
    }
  }

  Future<dynamic> postData(
      {FormData formData, Map<String, dynamic> headers, String url}) async {
    try {
      dio.options.baseUrl = baseUrl;
      // headers != null ? dio.options.headers = headers : '';
      if (headers != null) dio.options.headers = headers;
      var jsonResponse;
      Response response = await dio.post(url, data: formData);
      jsonResponse = json.decode(response.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        jsonResponse = json.decode(response.toString());
        return jsonResponse;
      } else if (response == null) {
        return response;
      } else {
        return response;
      }
    } on DioError catch (e) {
      // that falls out of the range of 2xx and is also not 304.
      print(e.message);
      print(e.error);
      print(e.request);
      print(e.response);
    }
  }
}
