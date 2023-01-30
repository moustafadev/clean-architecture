part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class LoadingCategoriesState extends CategoriesState {}

class SuccessCategoriesState extends CategoriesState {
  const SuccessCategoriesState();
  @override
  List<Object> get props => [];
}

class ErrorCategoriesState extends CategoriesState {
  final String massage;

  const ErrorCategoriesState({required this.massage});
}

class ChangeCategoryState extends CategoriesState {}
