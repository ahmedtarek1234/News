import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/News_Response.dart';
import 'package:newsapp/shared/components/constant.dart';

import '../../../models/source-Response.dart';

class ApiManager {
  static Future<SourceResponse> getSources(String category) async {
    Uri url = Uri.https(contstants.Base_Url, "v2/top-headlines/sources",
        {"apiKey": "ca558a1e4d284332857bafc1d24e0e32","category":category });
    http.Response response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourceResponse.fromJson(json);
  }

  static Future<NewsResponse> getNewsData(String sourceId) async {
    Uri url =
        Uri.https(contstants.Base_Url, "/v2/everything", {"sources": sourceId});
    var response = await http
        .get(url, headers: {"x-api-key": "ca558a1e4d284332857bafc1d24e0e32"});
    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
  static Future<NewsResponse> getSearchNews(String query) async {
    print("----->$query");
    Uri url =
    Uri.https(contstants.Base_Url, "/v2/everything", {"q": query});
    var response = await http
        .get(url, headers: {"x-api-key": "ca558a1e4d284332857bafc1d24e0e32"});
    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
