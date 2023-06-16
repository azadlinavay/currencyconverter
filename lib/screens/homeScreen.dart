import 'package:currencyconverter/components/customDropDownMenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/homeController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Api Instance

  // varibales
  String? from = 'IQD';
  String? to = "USD";
  final controller = Get.put(
    Controller(),
  );

// List of Codes
  List<String>? currencies = [
    "AED",
    "AFN",
    "ALL",
    "AMD",
    "ANG",
    "AOA",
    "ARS",
    "AUD",
    "AWG",
    "AZN",
    "BAM",
    "BBD",
    "BDT",
    "BGN",
    "BHD",
    "BIF",
    "BMD",
    "BND",
    "BOB",
    "BOV",
    "BRL",
    "BSD",
    "BTN",
    "BWP",
    "BYN",
    "BZD",
    "CAD",
    "CDF",
    "CHE",
    "CHF",
    "CHW",
    "CLF",
    "CLP",
    "COP",
    "COU",
    "CRC",
    "CUC",
    "CUP",
    "CVE",
    "CZK",
    "DJF",
    "DKK",
    "DOP",
    "DZD",
    "EGP",
    "ERN",
    "ETB",
    "EUR",
    "FJD",
    "FKP",
    "GBP",
    "GEL",
    "GHS",
    "GIP",
    "GMD",
    "GNF",
    "GTQ",
    "GYD",
    "HKD",
    "HNL",
    "HTG",
    "HUF",
    "IDR",
    "ILS",
    "INR",
    "IQD",
    "IRR",
    "ISK",
    "JMD",
    "JOD",
    "JPY",
    "KES",
    "KGS",
    "KHR",
    "KMF",
    "KPW",
    "KRW",
    "KWD",
    "KYD",
    "KZT",
    "LAK",
    "LBP",
    "LKR",
    "LRD",
    "LSL",
    "LYD",
    "MAD",
    "MDL",
    "MGA",
    "MKD",
    "MMK",
    "MNT",
    "MOP",
    "MRU",
    "MUR",
    "MVR",
    "MWK",
    "MXN",
    "MXV",
    "MYR",
    "MZN",
    "NAD",
    "NGN",
    "NIO",
    "NOK",
    "NPR",
    "NZD",
    "OMR",
    "PAB",
    "PEN",
    "PGK",
    "PHP",
    "PKR",
    "PLN",
    "PYG",
    "QAR",
    "RON",
    "RSD",
    "CNY",
    "RUB",
    "RWF",
    "SAR",
    "SBD",
    "SCR",
    "SDG",
    "SEK",
    "SGD",
    "SHP",
    "SLE",
    "SLL",
    "SOS",
    "SRD",
    "SSP",
    "STN",
    "SVC",
    "SYP",
    "SZL",
    "THB",
    "TJS",
    "TMT",
    "TND",
    "TOP",
    "TRY",
    "TTD",
    "TWD",
    "TZS",
    "UAH",
    "UGX",
    "USD",
    "USN",
    "UYI",
    "UYU",
    "UYW",
    "UZS",
    "VED",
    "VES",
    "VND",
    "VUV",
    "WST",
    "XAF",
    "XAG",
    "XAU",
    "XBA",
    "XBB",
    "XBC",
    "XBD",
    "XCD",
    "XDR",
    "XOF",
    "XPD",
    "XPF",
    "XPT",
    "XSU",
    "XTS",
    "XUA",
    "XXX",
    "YER",
    "ZAR",
    "ZMW",
    "ZWL",
  ];

  // function to call and fetch all api currencies

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Exchange'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.42,
                height: 75,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: customDropDown(
                  currencies ?? [''],
                  from,
                  (value) {
                    setState(() {
                      from = value;
                    });
                  },
                ),
              ),
              Icon(
                Icons.currency_exchange,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.42,
                height: 75,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: customDropDown(
                  currencies ?? [''],
                  to,
                  (value) {
                    setState(() {
                      to = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              onChanged: (value) {
                // Handlling 0 to the input
                if (value == '') {
                  value = '0';
                }
                // put data to the function to run the query
                controller.getCurrencies(from: from!, to: to!, number: value);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<Controller>(
                  builder: (controller) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Amount:',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 24),
                            ),
                            Text(
                              NumberFormat.currency(
                                      decimalDigits: 2,
                                      symbol: to == 'USD'
                                          ? '\$'
                                          : to == "IQD"
                                              ? ' IQD '
                                              : '$to ')
                                  .format(controller.count.toDouble()),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                NumberFormat.currency(
                                        decimalDigits: 0,
                                        symbol: from == 'USD'
                                            ? '\$'
                                            : from == "IQD"
                                                ? ' IQD '
                                                : '$from ')
                                    .format(1),
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 18),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "=",
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 18),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                controller.singleAmount.toString(),
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 18),
                              ),
                              Text(
                                ' ${to!}',
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 18),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),

                // Convert
              ],
            ),
          ),
        ],
      ),
    );
  }
}
