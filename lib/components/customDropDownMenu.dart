import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

Widget customDropDown(List<String>? items, String? value, void onChange(val)) {
  final TextEditingController textEditingController = TextEditingController();

  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 4.0,
      horizontal: 18.0,
    ),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: DropdownButton2<String>(
      value: value,
      onChanged: (String? val) {
        onChange(val);
      },
      items: items
          ?.map<DropdownMenuItem<String>>((String val) => DropdownMenuItem(
                child: Text(val),
                value: val,
              ))
          .toList(),
      dropdownSearchData: DropdownSearchData(
        searchController: textEditingController,
        searchInnerWidgetHeight: 50,
        searchInnerWidget: Container(
          height: 50,
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 4,
            right: 8,
            left: 8,
          ),
          child: TextFormField(
            expands: true,
            maxLines: null,
            controller: textEditingController,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              hintText: 'Search for an item...',
              hintStyle: const TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
