import 'package:flutter/material.dart';
import 'package:shoping_app/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/helpers/helper_functions.dart';

class SChoiceChip extends StatelessWidget {
  const SChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = SHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? SColors.white : null),
      avatar: isColor ? SRoundedContainer(width: 50, height: 50, backgroundColor: SHelperFunctions.getColor(text)!) : null,
      labelPadding: isColor ? EdgeInsets.all(0) : null,
      /// Make icon in center
      padding: isColor ? EdgeInsets.all(0) : null,
      shape: isColor ? CircleBorder() : null,
      backgroundColor: isColor ? SHelperFunctions.getColor(text)! : null,
    );
  }
}
