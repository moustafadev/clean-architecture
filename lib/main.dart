import 'package:ecommerce/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/shared_preferences/cache_helper.dart';
import 'core/styles/colors.dart';
import 'features/home/presentation/bloc/catigories_bloc/bloc/categories_bloc.dart';
import 'features/home/presentation/bloc/products_bloc/products_bloc_bloc.dart';
import 'features/home/presentation/pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<CategoriesBloc>()..getCategories()),
        BlocProvider(create: (_) => locator<ProductsBloc>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        color: kWhiteBackground,
        title: 'ecommerce',
        home: HomeScreen(),
      ),
    );
  }
}
