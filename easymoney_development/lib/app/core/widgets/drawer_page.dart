import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/core/widgets/menu_list_tile.dart';
import 'package:easy_money/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(27, 50, 27, 20),
            decoration: const BoxDecoration(
              color: ColorConstants.lightGreyColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: getWidth / 4.5,
                  height: getWidth / 4.5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorConstants.lightGreyColor,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider('https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text(
                  "Dy Sovanarith",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              children: [
                MenuListTile(
                  onTap: () => debugPrint("My Wallet"),
                  icon: Icons.account_balance_wallet,
                  title: "My Wallet",
                  subTitle: "\$ 231",
                ),
                const Divider(),
                MenuListTile(
                  onTap: () => Get.offAllNamed(Routes.homeRoute),
                  icon: Icons.home,
                  title: "Home",
                ),
                MenuListTile(
                  onTap: () => Get.offAllNamed(Routes.myProductsRoute),
                  icon: Icons.web_sharp,
                  title: "My Products",
                ),
                MenuListTile(
                  onTap: () => Get.offAllNamed(Routes.myOrdersRoute),
                  icon: Icons.shopping_cart,
                  title: "My Orders",
                ),
                MenuListTile(
                  onTap: () => Get.offAllNamed(Routes.myFavoritesRoute),
                  icon: Icons.star_border,
                  title: "My Favorites",
                ),
                MenuListTile(
                  onTap: () => Get.offAllNamed(Routes.processingLoanRoute),
                  icon: Icons.attach_money,
                  title: "Processing Loan",
                ),
                MenuListTile(
                  onTap: () => Get.offAllNamed(Routes.loanHistoryRoute),
                  icon: Icons.monetization_on,
                  title: "Loan History",
                ),
                const Divider(),
                MenuListTile(
                  onTap: () => Get.offAllNamed(Routes.accountSettingRoute),
                  icon: Icons.person,
                  title: "Account Setting",
                ),
                MenuListTile(
                  onTap: () => Get.offAllNamed(Routes.signInRoute),
                  icon: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
