import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/News_Response.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "DetailsScreen";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Articles Article = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          Article.title ?? "",
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
      body: Container(
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
                  SizedBox(height: 20),
                  Text(Article.description ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black)),
                  SizedBox(height: 230),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        onPressed: () {
                          launchMyUrl(Article.url??"");
                        },
                        icon: Icon(Icons.arrow_back),
                        label: Text(
                          "View Full Article",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void launchMyUrl(String url)async{
  final Uri _url = Uri.parse(url);
  bool canLaunch=await canLaunchUrl(_url);
  if(canLaunch){
    launchUrl(_url);

  }else{
    print("cannot Launch");
  }
}
