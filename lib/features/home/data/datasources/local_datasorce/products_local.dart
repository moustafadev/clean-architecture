import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';

import '../../../../../core/dio/dio_api.dart';
import '../../../../../core/error/Failure.dart';
import '../../../../../core/shared_preferences/cache_helper.dart';
import '../../../../../core/styles/string.dart';
import '../../models/products_model.dart';

abstract class ProductsLocal {
  Future<AllProductsModel> getAllProductsLocal();
  Future<Unit> cacheProducts(AllProductsModel productsModel);
}

class ProductsLocalImpl implements ProductsLocal {
  final CacheHelper _cacheHelper;

  ProductsLocalImpl(this._cacheHelper);
  @override
  Future<Unit> cacheProducts(AllProductsModel productsModel) {
    _cacheHelper.saveData(
        key: PRODUCTSCACHED, value: json.encode(productsModel.toJson()));
    print('Success Cached Products');
    return Future.value(unit);
  }

  @override
  Future<AllProductsModel> getAllProductsLocal() {
    final products = _cacheHelper.getData(PRODUCTSCACHED);
    if (products != null) {
      return Future.value(json.decode(products));
    } else {
      throw EmptyCacheException();
    }
  }
}
