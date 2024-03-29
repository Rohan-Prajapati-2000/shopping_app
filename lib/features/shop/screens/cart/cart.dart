import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium)),

      body: SingleChildScrollView(

      ),

    );
  }

}