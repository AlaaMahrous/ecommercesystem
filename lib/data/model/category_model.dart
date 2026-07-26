class CategoryModel {
  final int categoryId;
  final String categoryName;
  final String categoryNameAr;
  final String categoryImage;
  final String categoryDatetime;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryNameAr,
    required this.categoryImage,
    required this.categoryDatetime,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: int.parse(json['category_id'].toString()),
      categoryName: json['category_name'],
      categoryNameAr: json['category_name_ar'],
      categoryImage: json['category_image'],
      categoryDatetime: json['category_datetime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'category_name_ar': categoryNameAr,
      'category_image': categoryImage,
      'category_datetime': categoryDatetime,
    };
  }
}
