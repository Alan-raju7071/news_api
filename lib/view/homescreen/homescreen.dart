import 'package:flutter/material.dart';
import 'package:news_api/controller/Homescreecontroller/Homescreencontroller.dart';
import 'package:news_api/utilits/colorconstant.dart';
import 'package:news_api/view/homescreen/widget/newscard.dart';
import 'package:news_api/view/newsdetails/newsdetail.dart';

import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List Newslist = [
    "All",
    "Business",
    "sports",
    "Entertainment",
    "Science",
    "Technology"
  ];

  int selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = context.read<HomeScreenController>();
      controller.getData();
      controller.searchNews(Newslist[selectedCategoryIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        leading: Icon(Icons.more_vert_outlined),
        title:Text("Latest News"),
        centerTitle: true,
        actions: [Icon(Icons.notifications_active_outlined)],
      ),
      body: Consumer<HomeScreenController>(
        builder: (context, controller, child) {
          if (controller.isLoading && controller.isCategoryLoading == false) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                
                 
                  SizedBox(height: 10),
                 TextField(
  onChanged: (value) {
    if (value.isNotEmpty) {
      context.read<HomeScreenController>().searchNews(value);
    } else {
      // If the search box is cleared, you might want to reset the category news
      context.read<HomeScreenController>().searchNews(Newslist[selectedCategoryIndex]);
    }
  },
  decoration: InputDecoration(
    prefixIcon: Icon(
      Icons.search,
      color: ColorConstants.black,
    ),
    hintText: "Search",
    hintStyle: TextStyle(fontSize: 15, color: Colors.black),
    suffixIcon: Icon(
      Icons.mic,
      color: ColorConstants.black,
    ),
    border: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(vertical: 15),
    fillColor: ColorConstants.grey,
  ),
),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    " News",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  latestnewssection(controller),
                  SizedBox(height: 20),
                  categorylistrowsection(controller),
                  SizedBox(height: 20),
                  latestnewssection(controller),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

 SizedBox latestnewssection(HomeScreenController controller) {
  return SizedBox(
    child: controller.isCategoryLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.categoryNewsList.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Newsdetailsscreen(
                        image: controller.categoryNewsList[index].urlToImage
                            .toString(),
                        author: controller.categoryNewsList[index].author
                            .toString(),
                        title: controller.categoryNewsList[index].title
                            .toString(),
                        des: controller.categoryNewsList[index].content
                            .toString(),
                        time: controller.categoryNewsList[index].publishedAt
                            .toString(),
                      ),
                    ));
              },
              child: LatestNews(
                author: controller.categoryNewsList[index].author.toString(),
                title: controller.categoryNewsList[index].title.toString(),
                description:
                    controller.categoryNewsList[index].description.toString(),
                image:
                    controller.categoryNewsList[index].urlToImage.toString(),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
          ),
  );
}

  SingleChildScrollView categorylistrowsection(
      HomeScreenController controller) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          Newslist.length,
          (index) => InkWell(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
              controller.searchNews(Newslist[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedCategoryIndex == index
                    ? ColorConstants.black
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                Newslist[index],
                style: TextStyle(
                  color: selectedCategoryIndex == index
                      ? ColorConstants.white
                      : ColorConstants.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox categorynewssection(HomeScreenController controller) {
    return SizedBox(
      child: controller.isCategoryLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.categoryNewsList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Newsdetailsscreen(
                          image: controller.categoryNewsList[index].urlToImage
                              .toString(),
                          author: controller.categoryNewsList[index].author
                              .toString(),
                          title: controller.categoryNewsList[index].title
                              .toString(),
                          des: controller.categoryNewsList[index].content
                              .toString(),
                          time: controller.categoryNewsList[index].publishedAt
                              .toString(),
                        ),
                      ));
                },
                child: LatestNews(
                  author: controller.categoryNewsList[index].author.toString(),
                  title: controller.categoryNewsList[index].title.toString(),
                  description:
                      controller.categoryNewsList[index].description.toString(),
                  image:
                      controller.categoryNewsList[index].urlToImage.toString(),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
    );
  }
}