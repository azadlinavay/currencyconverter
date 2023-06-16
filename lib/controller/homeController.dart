import 'package:get/get.dart';
import 'package:currencyconverter/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  double count = 0;
  double singleAmount = 0;
  static String apiSite =
      "https://v6.exchangerate-api.com/v6/cb2174413b94964f2449a4c4/latest/";
  static String apiSiteURL = "v6.exchangerate-api.com";

  static Future<http.Response> getUriForAPI({
    required String path,
  }) async {
    debugPrint("calling $apiSite$path");
    return await http.get(
      Uri.https(
        Controller.apiSiteURL,
        "/v6/cb2174413b94964f2449a4c4/latest/$path",
      ),
    );
  }

  // main function to fetch data from the APi

  getCurrencies(
      {required String from,
      required String number,
      required String to}) async {
    http.Response res = await http.get(
      Uri.https(
        Controller.apiSiteURL,
        "/v6/cb2174413b94964f2449a4c4/latest/$from",
      ),
    );

    int number1 = int.parse(number);
    var name = CurrencyModel.fromJson(res.body);

    var result = name.conversion_rates[to] * number1;

    count = result;
    singleAmount = name.conversion_rates[to] * 1;
    print(count);
    print("Azxad");

    update();
    // if (res.statusCode == 200) {
    //   var list = body["supported_codes"];
    //   List<String> currencies = list;
    //   print(currencies.first);
    //   return currencies;
    // } else {
    //   throw Exception('Failed to connect to the network!');
    // }
  }
}
