import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'camera_screen.dart';
import 'custom_page_transition_animation.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Instagram',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 7),
          child: Icon(
            CupertinoIcons.camera,
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(
            CupertinoIcons.bolt_horizontal_circle,
            color: Colors.black,
          ),
          SizedBox(width: 17),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 5,
            padding: EdgeInsets.all(17),
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemBuilder: (context, index) => Container(
              height: screenWidth * 1.0,
              width: screenWidth,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 3)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Icon(
                              CupertinoIcons.person,
                            ),
                            backgroundColor: Colors.blueGrey,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Gaurav Tantuway',
                            style: TextStyle(
                                color: Colors.black.withOpacity(.8),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Icon(
                        Icons.more_horiz_rounded,
                      )
                    ],
                  ),
                  Container(
                    height: screenWidth * .75,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assets/images/image.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.heart_solid,
                            color: Colors.pinkAccent,
                            size: 23,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '100',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            CupertinoIcons.bubble_right,
                            // color: Colors.black87,
                            color: Colors.black.withOpacity(.7),
                            size: 23,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '3',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            CupertinoIcons.rocket,
                            color: Colors.black.withOpacity(.7),
                            size: 23,
                          ),
                        ],
                      ),
                      Icon(
                        CupertinoIcons.bookmark,
                        color: Colors.black.withOpacity(.7),
                        size: 23,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(CupertinoIcons.house_alt_fill, size: 27),
                      Icon(
                        CupertinoIcons.search,
                        size: 27,
                        color: Colors.black54,
                      ),
                      SizedBox(),
                      Icon(
                        CupertinoIcons.heart,
                        size: 27,
                        color: Colors.black54,
                      ),
                      Icon(
                        CupertinoIcons.circle_filled,
                        size: 27,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(
                        MyCustomAnimatedRoute(
                          enterWidget: cameraScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
