import 'package:flutter/material.dart';

class CustomDropDownButtonClass extends StatefulWidget {
  final List<String> items;
  final double width;
  final void Function(String)? onChanged;

  CustomDropDownButtonClass({
    required this.items,
    required this.width,
    this.onChanged,
  });

  @override
  _CustomDropDownButtonClassState createState() =>
      _CustomDropDownButtonClassState();
}

class _CustomDropDownButtonClassState extends State<CustomDropDownButtonClass> {
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: widget.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 47, 47, 47),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        onChanged: (newValue) {
          setState(() {
            selectedItem = newValue!;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(newValue!);
          }
        },
        items: widget.items.map<DropdownMenuItem<String>>((String e) {
          return DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          );
        }).toList(),
        underline: Container(),
        dropdownColor: const Color.fromARGB(255, 47, 47, 47),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
