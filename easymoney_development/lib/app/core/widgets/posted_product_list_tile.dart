import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PostedProductListTile extends StatelessWidget {
  final DateTime dateTime;
  final String productName;
  final String productImage;
  final int price;
  final Function() onTap;

  List<String> get _months => [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      ];

  const PostedProductListTile({
    Key? key,
    required this.dateTime,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Posted Date and More button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Post date
            Row(
              children: [
                const Text(
                  "Post Date:",
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorConstants.greyPramiryColor,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  dateTime.day.toString() +
                      " " +
                      _months[dateTime.month] +
                      " " +
                      dateTime.year.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  color: ColorConstants.lightGreyColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  FeatherIcons.moreHorizontal,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        //Product Detail
        Row(
          children: [
            //Product Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: ColorConstants.lightGreyColor,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(productImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            //Product Name and Price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // width: 260,
                  child: Text(
                    productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6),
                ),
                Text(
                  "US \$" + price.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: ColorConstants.greyPramiryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
