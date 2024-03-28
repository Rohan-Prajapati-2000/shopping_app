import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/images/s_circular_image.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';

class SUserProfileTile extends StatelessWidget {
  const SUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SCircularImage(image: SImage.user,height: 50,width: 50,padding: 0),
      title: Text("MR.MIND", style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white)),
      subtitle: Text("mr.mind@gmail.com", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: SColors.white)),
    );
  }
}
