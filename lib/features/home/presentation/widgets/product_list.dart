import 'package:ecommerce/core/components/components.dart';
import 'package:ecommerce/core/styles/colors.dart';
import 'package:ecommerce/core/styles/dimensions.dart';
import 'package:ecommerce/core/styles/icons.dart';
import 'package:ecommerce/features/home/domain/entities/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc/products_bloc_bloc.dart';
import 'Product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required this.products}) : super(key: key);

  final List<Products> products;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 2.8,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              ProductCard(product: products[index]),
          separatorBuilder: (context, index) => wSizedBox2,
          itemCount: products.length),
    );
  }
}
