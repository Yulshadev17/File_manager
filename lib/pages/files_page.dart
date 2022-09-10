// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, import_of_legacy_library_into_null_safe
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart';
import 'package:file_manager/data/category_json.dart';
import 'package:file_manager/pages/file_detail_page.dart';
import 'package:file_manager/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({super.key});

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20),
              getTabs(),
              SizedBox(height: 20),
              getDateSection(),
              SizedBox(height: 20),
              pageIndex == 0 ? getMyCloudItems() : getMyTeamItems(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDateSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Date Modified',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Icon(
              LineIcons.arrowDown,
              size: 20,
            ),
          ],
        ),
        LineIcon(
          LineIcons.borderAll,
          size: 22,
          color: Colors.black.withOpacity(0.5),
        ),
      ],
    );
  }

  Widget getTabs() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
        color: secondary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          pageIndex == 0
              ? Flexible(
                  child: ElasticIn(
                    child: GestureDetector(
                      onTap: (() {
                        setState(
                          () {
                            pageIndex = 0;
                          },
                        );
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: (size.width - 45) / 2,
                          height: 50,
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'My cloud',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: (() {
                    setState(
                      () {
                        pageIndex = 0;
                      },
                    );
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        // color: primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'My cloud',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
          pageIndex == 1
              ? Flexible(
                  child: ElasticIn(
                    child: GestureDetector(
                      onTap: (() {
                        setState(
                          () {
                            pageIndex = 1;
                          },
                        );
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: (size.width - 45) / 2,
                          height: 50,
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Team cloud',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: (() {
                    setState(
                      () {
                        pageIndex = 1;
                      },
                    );
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: (size.width - 45) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        // color: primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Team Cloud',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget getMyCloudItems() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: List.generate(
        myCloudFilesContentJson.length,
        (index) {
          return GestureDetector(
            onTap: () {
              setState(
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FileDetailPage(
                        title: myCloudFilesContentJson[index]['title'],
                        file_Count: myCloudFilesContentJson[index]
                            ['file_Count'],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: (size.width - 50) / 2,
              height: (size.width - 50) / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: secondary.withOpacity(
                  0.08,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    myCloudFilesContentJson[index]['img'],
                    width: 65,
                  ),
                  SizedBox(height: 10),
                  Text(
                    myCloudFilesContentJson[index]['title'] +
                        " ( ${myCloudFilesContentJson[index]['file_count']} )",
                    style: TextStyle(
                        color: secondary, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getMyTeamItems() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: List.generate(
        teamCloudFilesContentJson.length,
        (index) {
          return GestureDetector(
            onTap: () {
              setState(
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FileDetailPage(
                        title: teamCloudFilesContentJson[index]['title'],
                        file_Count: teamCloudFilesContentJson[index]
                            ['file_Count'],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: (size.width - 50) / 2,
              height: (size.width - 50) / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: secondary.withOpacity(
                  0.08,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    teamCloudFilesContentJson[index]['img'],
                    width: 65,
                  ),
                  SizedBox(height: 10),
                  Text(
                    teamCloudFilesContentJson[index]['title'] +
                        " ( ${teamCloudFilesContentJson[index]['file_count']} )",
                    style: TextStyle(
                        color: secondary, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
