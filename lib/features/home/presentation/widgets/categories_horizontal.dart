import 'package:ecommerce/core/components/components.dart';
import 'package:ecommerce/core/styles/colors.dart';
import 'package:ecommerce/core/styles/dimensions.dart';
import 'package:ecommerce/features/home/presentation/bloc/catigories_bloc/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../locator.dart';
import '../bloc/products_bloc/products_bloc_bloc.dart';

class CategoriesHorizontal extends StatelessWidget {
  CategoriesHorizontal({Key? key}) : super(key: key);

  CategoriesBloc? bloc;
  @override
  Widget build(BuildContext context) {
    var bloc = CategoriesBloc.get(context);

    return SizedBox(
      height: 30,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  bloc.changeCategories(index);

                  ProductsBloc.get(context)
                      .getProducts(bloc.categories!.categories[index]);
                },
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      text(
                        bloc.categories!.categories[index],
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 17,
                            fontFamily: 'Raleway',
                            color: bloc.indexItem == index
                                ? kSoftBluePrimary
                                : kGreyC),
                      ),
                      hSizedBox1,
                      Expanded(
                        child: Container(
                          child: Divider(
                            height: 15,
                            thickness: 1,
                            color: bloc.indexItem == index
                                ? kSoftBluePrimary
                                : kTrans,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => wSizedBox2,
          itemCount: bloc.categories!.categories.length),
    );
  }
}
