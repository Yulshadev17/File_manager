// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace,

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:file_manager/data/category_json.dart';
import 'package:file_manager/data/recent_files_json.dart';
import 'package:file_manager/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              getStorageBox(),
              SizedBox(height: 30),
              getRecentFile(),
              SizedBox(height: 20),
              getCategoryFiles(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCategoryFiles() {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Category',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: List.generate(
              categoryJson.length,
              (index) {
                return Container(
                  width: 150,
                  height: 140,
                  margin: EdgeInsets.only(right: 15, top: 20),
                  decoration: BoxDecoration(
                    color: secondary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        categoryJson[index]['img'],
                        width: 40,
                      ),
                      SizedBox(height: 8),
                      Text(
                        categoryJson[index]['text'],
                        style: TextStyle(
                            color: secondary.withOpacity(0.9),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8),
                      Text(
                        categoryJson[index]['file_count'],
                        style: TextStyle(
                            fontSize: 14,
                            color: secondary.withOpacity(0.9),
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget getRecentFile() {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent File',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: List.generate(
              recentFilesJson.length,
              (index) {
                var fileType = "assets/icons/images.svg";
                if (recentFilesJson[index]['type'] == 'image') {
                  fileType = 'assets/icons/image.svg';
                } else if (recentFilesJson[index]['type'] == 'video') {
                  fileType = 'assets/icons/video.svg';
                }

                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    width: size.width * 0.6,
                    height: 160,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(22),
                      image: DecorationImage(
                          image: NetworkImage(recentFilesJson[index]['img']),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlurryContainer(
                          padding: EdgeInsets.zero,
                          blur: 3,
                          child: Container(
                            width: size.width * 0.6,
                            height: 60,
                            decoration: BoxDecoration(
                              color: white.withOpacity(0.2),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: SvgPicture.asset(
                                        fileType,
                                        color: white,
                                        width: 20,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      recentFilesJson[index]['file_name'],
                                      style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget getStorageBox() {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -40,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: white.withOpacity(0.2),
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            left: -50,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: white.withOpacity(0.2),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 120,
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: CircleProgressBar(
                    foregroundColor: white,
                    backgroundColor: white.withOpacity(0.2),
                    value: 0.68,
                    child: Center(
                      child: AnimatedCount(
                        style: TextStyle(color: white),
                        curve: Curves.linear,
                        count: 0.68,
                        unit: '%',
                        duration: Duration(milliseconds: 500),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '10.8 GB of 15 GB used',
                        style: TextStyle(color: white, fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 12, right: 12, top: 10, bottom: 10),
                          child: Text(
                            'Buy Storage',
                            style: TextStyle(
                                color: white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
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
