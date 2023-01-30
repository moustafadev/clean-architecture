import 'package:ecommerce/features/home/domain/entities/caregories.dart';

class CategoriesModel extends Categories {
  CategoriesModel({required super.categories});

  factory CategoriesModel.fromJson(List<dynamic> json) {
    return CategoriesModel(categories: json);
  }

  Map<String, dynamic> toJson() {
    return {'categories': categories};
  }
}
