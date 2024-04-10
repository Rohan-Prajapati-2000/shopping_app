import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  /// Empty Helper Function
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

  /// Convert model to Json Structure so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'isFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if(documentSnapshot.data() != null){
      final data = documentSnapshot.data()!;

      // Map JSON record to the model
      return CategoryModel(
        id: documentSnapshot.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? '',
      );
    } else{
      return CategoryModel.empty();
    }
  }
}
