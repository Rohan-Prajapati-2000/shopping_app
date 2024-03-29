import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoping_app/common/widgets/app_bar/app_bar.dart';
import 'package:shoping_app/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(showBackArrow: true, title: Text('Add New Address')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(SSizes.defaultSpace),
        child: Form(
          child: Column(
            children: [
             TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: "Name")),
              SizedBox(height: SSizes.spaceBtwInputField),
              TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: "Phone Number")),
              SizedBox(height: SSizes.spaceBtwInputField),
              Row(
                children: [
                  Expanded(flex: 1, child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: "Street"))),
                  SizedBox(width: SSizes.spaceBtwInputField),
                  Expanded(flex: 1, child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: "Postal Code"))),
                ],
              ),
              SizedBox(height: SSizes.spaceBtwInputField),
              Row(
                children: [
                  Expanded(flex: 1, child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: "City"))),
                  SizedBox(width: SSizes.spaceBtwInputField),
                  Expanded(flex: 1, child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: "State"))),
                ],
              ),
              SizedBox(height: SSizes.spaceBtwInputField),
              TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: "Country")),
              SizedBox(height: SSizes.defaultSpace),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Save')))

            ],
          ),
        ),
      ),
    );
  }
}
