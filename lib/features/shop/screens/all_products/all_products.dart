import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:shoping_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

import '../../models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureModel});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureModel;

  @override
  Widget build(BuildContext context) {

    // Initialize controller for managing product fetching
    final controller = Get.put(AllProductsControlller());

    return Scaffold(
      appBar: SAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: FutureBuilder(
            future: futureModel ?? controller.fetchProductByQuery(query),
            builder: (context, snapshot) {
              return SSortableProducts();
            }
          ),
        ),
      ),
    );
  }
}
