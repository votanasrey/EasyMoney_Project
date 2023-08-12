import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/modules/dashboard/dashboard.dart';
import 'package:easy_money/app/modules/home/home.dart';
import 'package:easy_money/app/modules/marketplace/marketplace.dart';
import 'package:easy_money/app/modules/modules.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [MarketplacePage(), HomePage(), ProfilePage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: ColorConstants.greyPramiryColor,
          selectedItemColor: ColorConstants.greenPrimaryColor,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          items: [
            _bottomNavigationBarItem(
              icon: FeatherIcons.shoppingCart,
              label: 'Marketplace',
            ),
            _bottomNavigationBarItem(
              icon: FeatherIcons.dollarSign,
              label: 'Loan',
            ),
            _bottomNavigationBarItem(
              icon: FeatherIcons.user,
              label: 'Account',
            )
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
