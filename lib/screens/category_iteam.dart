import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';

class CategryIteam extends StatelessWidget {
  int index;
  categoryModel model;

  CategryIteam({required this.model, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(28),
            topLeft: Radius.circular(28),
            bottomLeft: index.isOdd ? Radius.circular(28) : Radius.zero,
            bottomRight: index.isEven ?  Radius.circular(28) :Radius.zero),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                model.name,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 17),
              ))
        ],
      ),
    );
  }
}
