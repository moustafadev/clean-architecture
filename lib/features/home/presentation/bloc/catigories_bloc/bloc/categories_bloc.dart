import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/home/data/models/categories_model.dart';
import 'package:ecommerce/features/home/domain/usercases/get_categorise_usercase.dart';
import 'package:ecommerce/features/home/presentation/bloc/products_bloc/products_bloc_bloc.dart';
import 'package:ecommerce/features/home/presentation/widgets/Product_card.dart';
import 'package:ecommerce/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/error/Failure.dart';
import '../../../../../../core/styles/string.dart';
import '../../../../domain/entities/caregories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Cubit<CategoriesState> {
  static CategoriesBloc get(context) => BlocProvider.of(context);

  final GetCategoriseUsercase getCategoriseUsercase;

  CategoriesBloc({required this.getCategoriseUsercase})
      : super(CategoriesInitial());

  int get indexItem => _indexItem;
  int _indexItem = 0;
  Categories? categories;

  void getCategories() async {
    emit(LoadingCategoriesState());
    final failureOrCategories = await getCategoriseUsercase.call();
    emit(_mapFailureToCategoriesState(failureOrCategories));
  }

  CategoriesState _mapFailureToCategoriesState(
      Either<Failure, Categories> failureOrCategories) {
    return failureOrCategories.fold(
        (failure) => ErrorCategoriesState(massage: _massageFailure(failure)),
        (category) {
      categories = category;

      return const SuccessCategoriesState();
    });
  }

  String _massageFailure(Failure failure) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return INTERNETNOTCONECTION;
      case ServerFailure:
        return SERVERERROR;
      case EmptyCacheFailure:
        return EMPTYCACHE;
      default:
        return "unexpected Error";
    }
  }

  void changeCategories(int index) {
    emit(CategoriesInitial());
    _indexItem = index;
    emit(ChangeCategoryState());
  }
}
