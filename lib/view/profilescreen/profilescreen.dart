import 'package:flutter/material.dart';
import 'package:news_api/utilits/colorconstant.dart';
import 'package:news_api/view/slpashscreen/splashscreen.dart';


class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              radius: 60,
              
              backgroundImage: NetworkImage("https://images.pexels.com/photos/29504483/pexels-photo-29504483/free-photo-of-stylish-fashion-portrait-in-lahore-studio.jpeg?auto=compress&cs=tinysrgb&w=600"),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Muneeb Malhotra",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
           
            
            SizedBox(
              height: 5,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: ColorConstants.black,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Saved",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.black),
                    )
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: ColorConstants.black,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "setting",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.black),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.logout_rounded,
                      color: ColorConstants.black,
                      size: 30,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(),));
                      },
                      child: Text(
                        "logout",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.black),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}