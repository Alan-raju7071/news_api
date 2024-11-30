import 'package:flutter/material.dart';
import 'package:news_api/utilits/colorconstant.dart';


class Newsdetailsscreen extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final String des;
  final String? time;

  Newsdetailsscreen({
    super.key,
    required this.image,
    required this.author,
    required this.des,
    required this.title,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle favorite button logic here
        },
        child: const Icon(Icons.favorite_border_outlined, color: Colors.black),
      ),
      appBar: AppBar(
        actions: [Icon(Icons.more_vert)],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              // Image Section
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Title and Author Section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorConstants.grey.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "By $author",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Description Section
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          des,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(time!)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}