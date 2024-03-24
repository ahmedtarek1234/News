import 'package:flutter/material.dart';
import 'package:newsapp/screens/news_tabs.dart';
import 'package:newsapp/shared/network/remote/Api-manager.dart';

class dataTap extends StatelessWidget {
  String categoryId;
   dataTap({required this.categoryId,super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Something Went Wrong"));
        }
        var SourcesList = snapshot.data?.sources ?? [];
        if (SourcesList.isEmpty) {
          return Center(child: Text("No Sources"));
        }
        return newsTap(sources: SourcesList);
      },
    );
  }
}
