import 'package:get/get.dart';
import 'package:shoping_app/data/repositories/categories/category_repository.dart';
import 'package:shoping_app/features/shop/models/category_model.dart';
import 'package:shoping_app/utils/popups/full_screen_loader.dart';
import 'package:shoping_app/utils/popups/loaders.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// -- Load category data
  Future<void> fetchCategories() async{
    try{
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories form data source (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();
      
      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());


    } catch (e){
      SLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
  /// -- Load selected category data
  /// -- Get category or Sub-Category Products.
}