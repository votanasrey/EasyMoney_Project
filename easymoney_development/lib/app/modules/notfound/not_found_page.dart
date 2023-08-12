import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../routes/routes.dart';

class NotfoundPage extends StatelessWidget {
  const NotfoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not Found Page"),
      ),
      body: const ListTile(
        title: Text("Not Found Page Please go back to home page"),
        subtitle: Text('Get.offAllNamed(AppRoutes.Home)'),
        // onTap: () => Get.offAllNamed(Routes.homeRoute),
      ),
    );
  }
}
