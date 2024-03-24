import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/screens/category_iteam.dart';

class categoryTab extends StatelessWidget {
  Function onClicked;
  categoryTab({required this.onClicked,super.key});

  List<categoryModel> allCategories = categoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Pick your category of interest",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onClicked(allCategories[index]);

                  },
                    child: CategryIteam(
                        model: allCategories[index], index: index));
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 20),
              itemCount: allCategories.length,
            ),
          )
        ],
      ),
    );
  }
}
