import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/widgets/drawer_page.dart';

import 'my_favorites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoritesPage extends GetView<MyFavoritesController> {
  const MyFavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color:Colors.black),
        title: const Text(
          "My Favorites",
          style: TextStyle(
            color: ColorConstants.blackColor,
          ),
        ),
      ),
      body: const Center(
        child: Text("On progress"),
      ),
      drawer: const DrawerPage(),
    );
  }
}
