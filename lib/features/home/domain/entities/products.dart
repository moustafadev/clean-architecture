import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AllProducts extends Equatable {
  AllProducts({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  @override
  List<Object?> get props => [products, total, skip, limit];
}

class Products extends Equatable {
  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  String rating;
  String stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        discountPercentage,
        rating,
        stock,
        brand,
        category,
        thumbnail,
        images,
      ];
}
