import 'package:ecommerce/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/components/components.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/icons.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        AppIcons.menu(22),
        wSizedBox2,
        Container(
          width: size.width / 1.5,
          height: size.height / 14,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: kGrey.withOpacity(0.5))),
          child: Row(
            children: [
              wSizedBox2,
              AppIcons.search(22),
              wSizedBox1,
              Expanded(
                child: textFormField(
                    enabledBorder: InputBorder.none,
                    textInputType: TextInputType.text,
                    focusedBorder: InputBorder.none,
                    onTap: () {},
                    controller: controller,
                    label: 'Search',
                    textStyLelabel: const TextStyle(fontSize: 16)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
