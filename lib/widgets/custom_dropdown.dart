import 'package:flutter/material.dart';

class CustomDropDownButtonClass extends StatelessWidget {
  final List<String> items;
  final double width;

  CustomDropDownButtonClass({
    required this.items,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: width,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 47, 47, 47),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton(
        value: items.first,
        onChanged: (_) {},
        items: items.map((e) {
          return DropdownMenuItem(
            child: Text(e),
            value: e,
          );
        }).toList(),
        underline: Container(),
        dropdownColor: const Color.fromARGB(255, 47, 47, 47),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
