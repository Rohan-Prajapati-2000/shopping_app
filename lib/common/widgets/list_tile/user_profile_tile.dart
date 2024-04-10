import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/images/s_circular_image.dart';
import 'package:shoping_app/features/personalization/controllers/user_controller.dart';
import 'package:shoping_app/utils/constants/colors.dart';
import 'package:shoping_app/utils/constants/image_strings.dart';

class SUserProfileTile extends StatelessWidget {
  const SUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final profilePicture = controller.user.value.profilePicture;
    final hasProfilePicture = profilePicture != null && profilePicture.isNotEmpty;
    return Obx(
        ()=> ListTile(
        leading: SCircularImage(image: hasProfilePicture ? profilePicture : SImage.user,height: 55,width: 55,padding: 0),
        title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white)),
        subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
        trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: SColors.white)),
      ),
    );
  }
}
