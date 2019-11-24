import 'dart:convert';
import 'package:fast_flutter_study/common/Global.dart';
import 'package:fast_flutter_study/model/BlogPostResponseModel.dart';
import 'package:http/http.dart' as http;

class ServerApi {
  static Future<http.Response> requestPost(
      String path, Map<String, String> body) async {
    Map<String, String> header;
    header = {};
    final res = await http.post(
      Global.BASE_URL + path,
      body: body,
      headers: header,
    );
    return _request_tail(res);
  }

  static Future<http.Response> requestPut(
      String path, Map<String, String> body) async {
    Map<String, String> header;
    header = {};
    final res = await http.put(
      Global.BASE_URL + path,
      body: body,
      headers: header,
    );
    return _request_tail(res);
  }

  static Future<http.Response> requestGet(
      String path, Map<String, String> query) async {
    final param = Uri(queryParameters: query);
    Map<String, String> header;
    header = {};
    final res = await http.get(
      Global.BASE_URL + path + (query == null ? "" : param.toString()),
      headers: header,
    );
    return _request_tail(res);
  }

  static http.Response _request_tail(http.Response res) {
    print(res.body);
    if (res.statusCode ~/ 100 == 2) {
      return res;
    }

    throw ServerApiException(res);
  }

  static Future<List<BlogPostResponseModel>> fetchBlogPostResponseModelList(
      Map<String, dynamic> query) async {
    final res =
        await requestGet('/wp-json/wp/v2/posts?per_page=100&_embed', null);
    print(json.decode(res.body));
    return json
        .decode(res.body)
        .map<BlogPostResponseModel>(
            (item) => BlogPostResponseModel.fromJson(item))
        .toList();
  }
}

class ServerApiException implements Exception {
  http.Response response;

  ServerApiException(this.response);
}
