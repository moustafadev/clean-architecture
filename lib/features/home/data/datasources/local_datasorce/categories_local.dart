import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/shared_preferences/cache_helper.dart';
import 'package:ecommerce/features/home/data/models/categories_model.dart';
import 'package:ecommerce/features/home/domain/entities/caregories.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/styles/string.dart';

abstract class CategoryLocal {
  Future<CategoriesModel> getAllCategoryLocal();
  Future<Unit> cacheCategory(CategoriesModel categoryModel);
}

class CategoriesLocalImpl implements CategoryLocal {
  final CacheHelper cacheHelper;

  CategoriesLocalImpl(this.cacheHelper);

  @override
  Future<Unit> cacheCategory(CategoriesModel categoryModel) {
    cacheHelper.saveData(
        key: CATEGORIESCACHED, value: json.encode(categoryModel.toJson()));
    return Future.value(unit);
  }

  @override
  Future<CategoriesModel> getAllCategoryLocal() {
    final categories = cacheHelper.getData(CATEGORIESCACHED);
    if (categories != null) {
      return Future.value(json.decode(categories));
    } else {
      throw EmptyCacheException();
    }
  }
}
