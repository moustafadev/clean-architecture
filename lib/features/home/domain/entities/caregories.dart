import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  List<dynamic> categories;
  Categories({required this.categories});
  @override
  List<Object?> get props => [categories];
}
