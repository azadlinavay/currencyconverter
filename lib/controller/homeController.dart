import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:currencyconverter/models/currency_model.dart';
import 'package:http/http.dart' as http;

import '../components/http_helper.dart';

class Controller extends GetxController {
  double amount = 0;
  double singleAmount = 0;

  // main function to fetch data from the APi
  getCurrencies(
      {required String from,
      required String number,
      required String to}) async {
    try {
      final response = await http.get(
        Uri.https(
          HttpHelper.apiSiteURL,
          "/v6/cb2174413b94964f2449a4c4/latest/$from",
        ),
      );
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          // to convert from String to number
          int number1 = int.parse(number);
          var name = CurrencyModel.fromJson(response.body);
          var result = name.conversion_rates[to] * number1;
          amount = result;
          singleAmount = name.conversion_rates[to] * 1;
          update();
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (_) {
      // to handle connection state error.
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$_'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      );
      rethrow;
    }
  }
}
