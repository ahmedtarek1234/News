import 'package:flutter/material.dart';
import 'package:newsapp/models/source-Response.dart';
import 'package:newsapp/screens/News_Iteam.dart';
import 'package:newsapp/screens/sourceItem.dart';
import 'package:newsapp/shared/network/remote/Api-manager.dart';

class newsTap extends StatefulWidget {
  List<Sources> sources;

  newsTap({super.key, required this.sources});

  @override
  State<newsTap> createState() => _newsTapState();
}

class _newsTapState extends State<newsTap> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            dividerColor: Colors.transparent,
            onTap: (value) {
              setState(() {});
              selectedIndex = value;
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: widget.sources
                .map((e) => Tab(
                    child: sourceIteam(
                        source: e,
                        isSelected:
                            widget.sources.elementAt(selectedIndex) == e)))
                .toList(),
          ),
        ),
        FutureBuilder(
          future:
              ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: Colors.green,));
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
                separatorBuilder: (context, index) => SizedBox(height: 12,),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NewsIteam(Article:ArticalsList[index]),
                  );
                },
                itemCount: ArticalsList.length,
              ),
            );
          },
        )
      ],
    );
  }
}
