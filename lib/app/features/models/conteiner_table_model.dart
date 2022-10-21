import 'package:flutter/material.dart';

class ConteinerTableModel extends StatelessWidget {
  const ConteinerTableModel(
    this.name, {
    Key? key,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(11.0),
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      child: Text(name),
    );
  }
}
