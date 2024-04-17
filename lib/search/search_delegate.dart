import 'package:flutter/material.dart';
import 'package:newsapp/screens/News_Iteam.dart';
import 'package:newsapp/shared/network/remote/Api-manager.dart';

class searchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSearchNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.green,
          ));
        }
        if (snapshot.hasError) {
          return Center(child: Text("Something Went Wrong"));
        }
        var ArticalsList = snapshot.data?.articles ?? [];
        if (ArticalsList.isEmpty) {
          return Center(child: Text("No Sources"));
        }
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NewsIteam(Article: ArticalsList[index]),
              );
            },
            itemCount: ArticalsList.length,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> sugesstions = [
      'Business',
      'Politcs',
      'sports',
      'Health',
      'Science',
      'Environment'
    ];
    return ListView.separated(
        itemBuilder: (context, index) => TextButton(
            onPressed: () {
              query = sugesstions[index];
              showResults(context);
            },
            child: Text(sugesstions[index])),
        separatorBuilder: (context, index) => Divider(),
        itemCount: sugesstions.length);
  }
}
