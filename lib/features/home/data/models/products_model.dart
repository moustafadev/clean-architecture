import 'package:ecommerce/features/home/domain/entities/products.dart';

class AllProductsModel extends AllProducts {
  AllProductsModel(
      {required super.products,
      required super.total,
      required super.skip,
      required super.limit});

  factory AllProductsModel.fromJson(Map<dynamic, dynamic> json) {
    return AllProductsModel(
        products: json['products'] != null
            ? List.from(json['products'])
                .map((e) => ProductsModel.fromJson(e))
                .toList()
            : null,
        total: json['total'],
        skip: json['skip'],
        limit: json['limit']);
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products,
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}

class ProductsModel extends Products {
  ProductsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.discountPercentage,
    required super.rating,
    required super.stock,
    required super.brand,
    required super.category,
    required super.thumbnail,
    required super.images,
  });
  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json['rating'].toString(),
      stock: json['stock'].toString(),
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List.castFrom<dynamic, String>(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['price'] = price;
    _data['discountPercentage'] = discountPercentage;
    _data['rating'] = rating;
    _data['stock'] = stock;
    _data['brand'] = brand;
    _data['category'] = category;
    _data['thumbnail'] = thumbnail;
    _data['images'] = images;
    return _data;
  }
}
