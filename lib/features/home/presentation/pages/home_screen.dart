import 'package:ecommerce/core/styles/dimensions.dart';
import 'package:ecommerce/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/components.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/string.dart';
import '../bloc/catigories_bloc/bloc/categories_bloc.dart';
import '../bloc/products_bloc/products_bloc_bloc.dart';
import '../widgets/categories_horizontal.dart';
import '../widgets/header_widget.dart';
import '../widgets/product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackground,
      body: body(context),
    );
  }

  Widget body(BuildContext context) =>
      BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          var bloc = CategoriesBloc.get(context);
          Size size = MediaQuery.of(context).size;
          if (state is LoadingCategoriesState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SuccessCategoriesState) {}
          return Padding(
            padding:
                EdgeInsets.only(left: size.width / 6, top: size.height * 0.09),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(),
                hSizedBox3,
                text(
                  'Order online',
                  Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 30, fontWeight: FontWeight.bold, height: 1),
                ),
                hSizedBox1,
                text(
                  'collect in store',
                  Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 30, fontWeight: FontWeight.bold, height: 1),
                ),
                hSizedBox3,
                CategoriesHorizontal(),
                hSizedBox3,
                BlocBuildListProduct(
                  tagCategory: bloc.categories!.categories[bloc.indexItem],
                ),
                hSizedBox2,
                seeMorwWidget(context),
              ],
            ),
          );
        },
      );

  Widget seeMorwWidget(context) => Row(
        children: [
          Spacer(),
          text(
            'see more',
            Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: kSoftBluePrimary),
          ),
          const Icon(
            Icons.arrow_forward,
            color: kSoftBluePrimary,
          ),
          wSizedBox1
        ],
      );
}

class BlocBuildListProduct extends StatelessWidget {
  const BlocBuildListProduct({Key? key, required this.tagCategory})
      : super(key: key);
  final String tagCategory;
  @override
  Widget build(BuildContext context) {
    ProductsBloc.get(context).getProducts(tagCategory);
    return BlocBuilder<ProductsBloc, ProductsBlocState>(
      builder: (context, state) {
        if (state is LoadingProductsState) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: const Center(child: CircularProgressIndicator()));
        } else if (state is SuccessProductsState) {
          return ProductList(
            products: state.allProducts.products!,
          );
        }
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Center(
            child: Text(
              SERVERERROR,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        );
      },
    );
  }
}
