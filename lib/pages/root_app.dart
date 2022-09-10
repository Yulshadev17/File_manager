// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:file_manager/data/root_app_json.dart';
import 'package:file_manager/pages/files_page.dart';
import 'package:file_manager/pages/home_page.dart';
import 'package:file_manager/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getTabs(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        HomePage(),
        FilesPage(),
        Center(
          child: Text('Trash'),
        ),
        Center(
          child: Text('Profil'),
        )
      ],
    );
  }

  Widget getTabs() {
    return SalomonBottomBar(
      currentIndex: pageIndex,
      onTap: (index) {
        setState(() {
          pageIndex = index;
        });
      },
      items: List.generate(
        rootAppJson.length,
        (index) => SalomonBottomBarItem(
          icon: SvgPicture.asset(
            rootAppJson[index]['icon'],
            color: rootAppJson[index]['color'],
          ),
          title: Text(rootAppJson[index]['text']),
        ),
      ),
    );
  }
}
