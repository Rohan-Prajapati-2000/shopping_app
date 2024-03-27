import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/app_bar/STabBar.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/brands/brand_card.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/search_container.dart';
import 'package:shoping_app/common/widgets/layout/grid_layout.dart';
import 'package:shoping_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:shoping_app/common/widgets/texts/section_heading.dart';
import 'package:shoping_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/sizes.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: SAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
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
                      padding: const EdgeInsets.all(SSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          /// Search Bar
                          const SizedBox(height: SSizes.spaceBtwItems),
                          const SSearchContainer(
                            text: 'Search in Store',
                            showBorder: true,
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          const SizedBox(height: SSizes.spaceBtwSections),

                          /// Feature Brand
                          SSectionHeading(
                              title: "Feature Brand", onPressed: () {}),
                          const SizedBox(height: SSizes.spaceBtwItems / 1.5),

                          SGridLayout(
                              itemCount: 4,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                return const SBrandCard(showBorder: true);
                              })
                        ],
                      ),
                    ),

                    /// Tabs
                    bottom: const STabBar(tabs: [
                      Tab(child: Text('Sport')),
                      Tab(child: Text('Furniture')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Cloths')),
                      Tab(child: Text('Cosmetics')),
                    ]))
              ];
            },
            body: const TabBarView(children: [
              SCategoryTab(),
              SCategoryTab(),
              SCategoryTab(),
              SCategoryTab(),
              SCategoryTab(),
            ])),
      ),
    );
  }
}
