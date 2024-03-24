import 'package:flutter/painting.dart';

class categoryModel {
  String id;
  String name;
  String image;
  Color color;

  categoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.color});

static  List<categoryModel> getCategories() {
    return [
      categoryModel(
        id: "business",
        name: "Business",
        image: "assets/images/b.png",
        color: Color(0xffCF7E48),
      ),
      categoryModel(
        id: "entertainment",
        name: "Politics",
        image: "assets/images/p.png",
        color:  Color(0xff003E90),
      ),
      categoryModel(
        id: "sports",
        name: "Sports",
        image: "assets/images/s.png",
        color: Color(0xffC91C22),

      ),
      categoryModel(
        id: "health",
        name: "Health",
        image: "assets/images/h.png",
        color: Color(0xffED1E79),
      ),
      categoryModel(
        id: "science",
        name: "Science",
        image: "assets/images/science.png",
        color: Color(0xffF2D352),
      ),
      categoryModel(
        id: "general",
        name: "Enviroment",
        image: "assets/images/environment.png",
        color: Color(0xff4882CF),
      ),

    ];
  }
}
