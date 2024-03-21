import 'package:flutter/material.dart';
import 'package:newsapp/models/source-Response.dart';

class sourceIteam extends StatelessWidget {
  Sources source;
  bool isSelected;

  sourceIteam({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.green)),
      child: Text(
        source.name ?? "",
        style: TextStyle(color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}
