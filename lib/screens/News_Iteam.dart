import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/News_Response.dart';
import 'package:newsapp/screens/details_screen.dart';

class NewsIteam extends StatelessWidget {
  Articles Article;

  NewsIteam({required this.Article, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.routeName,arguments: Article);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: Article.urlToImage ?? "",
                height: 250,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Article.source?.name ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                  ),
                  Text(Article.title ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.black)),
                  Text(Article.description ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
