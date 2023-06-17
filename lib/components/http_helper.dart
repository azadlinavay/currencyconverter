import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  static String apiSite =
      "https://v6.exchangerate-api.com/v6/cb2174413b94964f2449a4c4/latest/";
  static String apiSiteURL = "v6.exchangerate-api.com";

  static Future<http.Response> getUriForAPI({
    required String path,
  }) async {
    debugPrint("calling $apiSite$path");
    return await http.get(
      Uri.https(
        HttpHelper.apiSiteURL,
        "/v6/cb2174413b94964f2449a4c4/latest/$path",
      ),
    );
  }
}
