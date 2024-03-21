import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/search_container.dart';
import 'package:shoping_app/common/widgets/images/s_circular_image.dart';
import 'package:shoping_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [SCartCounterIcon(onPressed: () {})],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: SHelperFunctions.isDarkMode(context)
                    ? SColors.black
                    : SColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(SSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      /// Search Bar
                      SizedBox(height: SSizes.spaceBtwItems),
                      SSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                      padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: SSizes.spaceBtwSections),

                      /// Feature Brand
                      SSectionHeading(title: "Feature Brand", onPressed: (){}),
                      SizedBox(height: SSizes.spaceBtwItems/1.5),

                      SRoundedContainer(
                        padding: EdgeInsets.all(SSizes.sm),
                        showBorder: true,
                        backgroundColor: Colors.transparent,
                        child: Row(
                          children: [
                            /// Icon
                            SCircularImage(
                              isNetworkImage: false,
                              image: SImage.clothIcon,
                              backgroundColor: Colors.transparent,
                              overlayColor: SHelperFunctions.isDarkMode(context) ? SColors.white : SColors.black,
                            ),
                            SizedBox(height: SSizes.spaceBtwItems/2),

                            /// Text

                          ],
                        ),
                      )
                      ///
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container()),
    );
  }
}

