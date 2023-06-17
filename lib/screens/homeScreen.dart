import 'package:currencyconverter/components/customDropDownMenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/code_list.dart';
import '../components/result_card.dart';
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
  List<String>? currencies = CodeList().currencies;

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
              Text("From"),
              // DropDown One
              customDropDown(
                currencies ?? [''],
                from,
                (value) {
                  setState(() {
                    from = value;
                  });
                },
              ),

              Text("To"),
              // DropDown Two
              customDropDown(
                currencies ?? [''],
                to,
                (value) {
                  setState(() {
                    to = value;
                  });
                },
              ),
            ],
          ),
          // Input
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
          // Result Card
          resultCard(context: context, from: from!, to: to!),
        ],
      ),
    );
  }
}
