import 'package:flutter/material.dart';
import 'package:news_api/utilits/colorconstant.dart';


class LatestNews extends StatelessWidget {
  String image;
  String title;
  String description;
  String author;
  LatestNews(
      {super.key,
      required this.image,
      required this.description,
      required this.author,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 320,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Text(
            title,
            style: TextStyle(
              color: ColorConstants.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "By $author",
            style: TextStyle(color: ColorConstants.white, fontSize: 13),
          ),
          SizedBox(height: 70),
          Text(
            description,
            style: TextStyle(
              color: ColorConstants.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}