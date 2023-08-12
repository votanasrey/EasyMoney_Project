import 'package:easy_money/app/core/constants/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (logic) {
        return Scaffold(
          body: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  alignment: Alignment.center,
                  child: Image.asset(ImageConstants.easyMoneyLogoPng),
                );
              }

              return const SizedBox();
            },
          ),
        );
      },
    );
  }
}
