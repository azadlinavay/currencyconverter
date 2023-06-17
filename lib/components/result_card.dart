import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../controller/homeController.dart';

Container resultCard(
    {required BuildContext context, required String from, required String to}) {
  return Container(
    margin: EdgeInsets.all(15),
    width: MediaQuery.of(context).size.width,
    height: 150,
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // GetX to update
        GetBuilder<Controller>(
          builder: (controller) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Total Amount: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      NumberFormat.currency(
                              decimalDigits: 2,
                              symbol: to == 'USD'
                                  ? '\$'
                                  : to == "IQD"
                                      ? ' IQD '
                                      : '$to ')
                          .format(controller.amount.toDouble()),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "=",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        controller.singleAmount.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        ' ${to}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
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
  );
}
