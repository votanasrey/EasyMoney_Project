import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/core/constants/storage_contants.dart';
import 'package:easy_money/app/core/widgets/menu_list_tile.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:easy_money/app/data/data.dart';
import 'package:easy_money/app/data/repositories/user_repo.dart';
import 'package:easy_money/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'profile.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: ColorConstants.lightGreyColor,
        body: controller.isLogged.value
            ? SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header,
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 27, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuCard(
                        title: "Wallet",
                        icon: FeatherIcons.creditCard,
                        onTap: () {},
                      ),
                      MenuCard(
                        title: "Loans",
                        icon: FeatherIcons.fileText,
                        onTap: () => Get.toNamed(Routes.loanHistoryRoute),
                      ),
                      MenuCard(
                        title: "Orders",
                        icon: FeatherIcons.shoppingBag,
                        onTap: () => Get.toNamed(Routes.myOrdersRoute),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                _menu,
                const SizedBox(height: 40),
              ],
            ),
          ),
        )
            : SizedBox(
          width: getWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign in to manage your account.",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(height: 15),
              MaterialButton(
                color: ColorConstants.greenPrimaryColor,
                onPressed: () => Get.offAllNamed(Routes.signInRoute),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  get _header {
    return InkWell(
      onTap: () => Get.toNamed(Routes.editProfileRoute, arguments: controller),
      child: Container(
        color: ColorConstants.greenPrimaryColor,
        padding:
        const EdgeInsets.only(top: 50, bottom: 30, left: 27, right: 27),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //profile image
            Container(
              width: getWidth / 3.45,
              height: getWidth / 3.45,
              decoration: BoxDecoration(
                color: ColorConstants.lightGreyColor,
                borderRadius: BorderRadius.circular(getWidth / 13),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    controller.profileImage.value,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            // name,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.lastName.value + "\n" + controller.firstName.value,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.whiteColor,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.whiteColor,
                      ),
                    ),
                    Icon(Icons.navigate_next, color: Colors.white),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  get _menu {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
      child: Column(
        children: [
          MenuListTile(
            onTap: () => Get.toNamed(Routes.myProductsRoute),
            icon: FeatherIcons.shoppingCart,
            title: "Posted Product",
          ),
          const SizedBox(height: 20),
          MenuListTile(
            onTap: () {
              UserRepo userRepo = UserRepo();
              AccessToken access = box.read(BoxKey.accessToken);
              userRepo.getUser(access.accessToken).then((value) {
                debugPrint(value.firstName);
              });
            },
            icon: FeatherIcons.settings,
            title: "Account Setting",
          ),
          const SizedBox(height: 20),
          MenuListTile(
            onTap: () => controller.signOut(),
            icon: FeatherIcons.arrowLeft,
            title: "Sign Out",
          ),
        ],
      ),
    );
  }
}
