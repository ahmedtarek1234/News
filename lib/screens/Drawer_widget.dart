import 'package:flutter/material.dart';

class drawerWidget extends StatelessWidget {
  Function onClick;

  drawerWidget({required this.onClick, super.key});

  static const Category_id = 1;
  static const Setting_id = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .70,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.green,
            child: Text(
              "News App!",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              onClick(Category_id);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 22),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              onClick(Setting_id);
            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 22),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
