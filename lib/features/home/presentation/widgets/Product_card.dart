import 'package:ecommerce/features/home/domain/entities/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/components/components.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/icons.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Products product;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 2,
      height: size.height * 0.35,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: size.width / 2,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      offset: const Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                )),
          ),
          Positioned(
            child: CircleAvatar(
                radius: 50, backgroundImage: NetworkImage(product.thumbnail)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '${product.title}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kBlack, fontSize: 22),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Align(
              alignment: Alignment.center,
              child: text(
                product.brand,
                Theme.of(context).textTheme.bodyText1!.copyWith(color: kGrey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: text(
                '\$${product.price}',
                Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kSoftBluePrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
