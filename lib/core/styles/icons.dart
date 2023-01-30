import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AppTheme.dart';

String _pathBase = 'assets/images';
String _iconsPathBase = '$_pathBase/vector/icons';

class AppIcons {
  static Map<String, String> paths = {
    'menu': '$_pathBase/home/menu.svg',
    'search': '$_pathBase/home/search.svg',
    'clock': '$_pathBase/home/clock.png',
  };
  static SvgPicture _pic(String path, double size, Color? color) =>
      SvgPicture.asset(path, width: size, color: color);

  static Image _asset(String path, double size, Color? color) => Image.asset(
        path,
        width: size,
        color: color,
      );
  static Image imageNetwork(String path, double size, double height) =>
      Image.network(
        path,
        width: size,
        height: height,
      );
  static SvgPicture menu(double size, [Color? color]) =>
      _pic(paths['menu']!, size, color);
  static SvgPicture search(double size, [Color? color]) =>
      _pic(paths['search']!, size, color);
  static Image clock(double size, [Color? color]) =>
      _asset(paths['clock']!, size, color);
}
