import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/common/widgets/custom_shape/curved_edges/curved_edge_widget.dart';
import 'package:shoping_app/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SCurvedEdgeWidget(
              child: Container(
                color: SColors.primaryColor,
                padding: EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(top: -150, right: -250 ,child: SCircularWidgete(backgroundColor: SColors.textWhite.withOpacity(0.1))),
                      Positioned(top: 100, right: -300 ,child: SCircularWidgete(backgroundColor: SColors.textWhite.withOpacity(0.1))),
                      Positioned(child: SCircularWidgete(backgroundColor: SColors.textWhite.withOpacity(0.0))),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



