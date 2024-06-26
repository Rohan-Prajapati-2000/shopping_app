import 'package:get/get.dart';
import 'package:shoping_app/features/authentication/screens/login/login.dart';
import 'package:shoping_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shoping_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shoping_app/features/authentication/screens/signup/signup.dart';
import 'package:shoping_app/features/authentication/screens/signup/verify_email.dart';
import 'package:shoping_app/features/personalization/screens/address/address.dart';
import 'package:shoping_app/features/personalization/screens/profile/profile.dart';
import 'package:shoping_app/features/personalization/screens/setting/setting.dart';
import 'package:shoping_app/features/shop/screens/cart/cart.dart';
import 'package:shoping_app/features/shop/screens/checkout/checkout.dart';
import 'package:shoping_app/features/shop/screens/home/home.dart';
import 'package:shoping_app/features/shop/screens/order/order.dart';
import 'package:shoping_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:shoping_app/features/shop/screens/store/store.dart';
import 'package:shoping_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:shoping_app/routes/routes.dart';

class AppRoutes{
  static final pages = [
    GetPage(name: SRoutes.home, page: ()=> const HomeScreen()),
    GetPage(name: SRoutes.store, page: ()=> const StoreScreen()),
    GetPage(name: SRoutes.favourites, page: ()=> const FavouriteScreen()),
    GetPage(name: SRoutes.settings, page: ()=> const SettingScreen()),
    GetPage(name: SRoutes.productReviews, page: ()=> const ProductReviewScreen()),
    GetPage(name: SRoutes.order, page: ()=> OrderScreen()),
    GetPage(name: SRoutes.checkout, page: ()=> CheckoutScreen()),
    GetPage(name: SRoutes.cart, page: ()=>  CartScreen()),
    GetPage(name: SRoutes.userProfile, page: ()=> const ProfileScreen()),
    GetPage(name: SRoutes.userAddress, page: ()=> const UserAddressScreen()),
    GetPage(name: SRoutes.signup, page: ()=> const SignupScreen()),
    GetPage(name: SRoutes.verifyEmail, page: ()=> const VerifyEmailScreen()),
    GetPage(name: SRoutes.signIn, page: ()=> const LoginScreen()),
    GetPage(name: SRoutes.forgetPassword, page: ()=> const ForgetPassword()),
    GetPage(name: SRoutes.onBoarding, page: ()=> const OnBoardingScreen()),
  ];
}