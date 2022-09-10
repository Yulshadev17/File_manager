// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:file_manager/data/recent_files_json.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class FileDetailPage extends StatefulWidget {
  final title;
  final file_Count;
  const FileDetailPage(
      {super.key, required this.title, required this.file_Count});

  @override
  State<FileDetailPage> createState() => _FileDetailPageState();
}

class _FileDetailPageState extends State<FileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(60),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: (() {
          Navigator.pop(context);
        }),
        icon: Icon(
          LineIcons.arrowLeft,
          color: Colors.black,
        ),
      ),
      title: Text(
        widget.title + " (${widget.file_Count})",
        style: TextStyle(color: Colors.black, fontSize: 17),
      ),
      centerTitle: true,
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            getDateSection(),
            SizedBox(height: 20),
            getItemLists(),
          ],
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
            Icon(LineIcons.arrowDown, size: 20),
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

  Widget getItemLists() {
    final size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: List.generate(
        imageFiles.length,
        (index) {
          return Container(
            width: (size.width - 60) / 2,
            height: (size.width - 50) / 2,
            child: Column(
              children: [
                Container(
                  width: (size.width - 60) / 2,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        imageFiles[index]['img'],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  imageFiles[index]['file_name'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text(
                  imageFiles[index]['file_size'],
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
