import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/screens/Drawer_widget.dart';
import 'package:newsapp/screens/categories_Tab.dart';
import 'package:newsapp/screens/data_tab.dart';
import 'package:newsapp/screens/news_tabs.dart';
import 'package:newsapp/shared/network/remote/Api-manager.dart';

import '../search/search_delegate.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: drawerWidget(onClick: onDrawerClicked),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: searchScreen());
                },
                icon: Icon(Icons.search))
          ],
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
            "News App",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.green,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              borderSide: BorderSide(color: Colors.transparent)),
        ),
        body: selectedCategory == null
            ? categoryTab(onClicked: onCatgroyClicked)
            : dataTap(
                categoryId: selectedCategory!.id,
              ),
      ),
    );
  }

  categoryModel? selectedCategory;

  onCatgroyClicked(category) {
    selectedCategory = category;
    setState(() {});
  }

  onDrawerClicked(id) {
    if (id == drawerWidget.Category_id) {
      selectedCategory = null;
      Navigator.pop(context);
      setState(() {});
    } else if (id == drawerWidget.Setting_id) {}
  }
}
