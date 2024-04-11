class ProductAttributeModel{
  String? name;   // Name is color name
  final List<String>? values; // values is green red blue

  ProductAttributeModel({this.name, this.values});

  /// Json Format
  toJson(){
    return {'Name': name, 'Values': values};
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductAttributeModel.fromJson(Map<String,dynamic> document){
    final data = document;

    if (data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );

  }





}