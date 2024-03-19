import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/custom_shape/curved_edges/curved_edge.dart';

class SCurvedEdgeWidget extends StatelessWidget {
  const SCurvedEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SCustomCurevedEdge(),
      child: child,
    );
  }
}