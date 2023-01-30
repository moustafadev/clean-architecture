import 'package:flutter/material.dart';

Widget textFormField({
  onFieldSubmitted,
  onTap,
  onChanged,
  validator,
  IconData? suffix,
  IconData? prefix,
  suffixPassword,
  required TextEditingController controller,
  required String label,
  required TextInputType textInputType,
  bool obscureText = false,
  InputBorder? focusedBorder,
  InputBorder? enabledBorder,
  InputBorder? errorBorder,
  TextStyle? textStyLelabel,
}) =>
    TextFormField(
      enableSuggestions: false,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: textInputType,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      cursorHeight: 20.0,
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Colors.grey.shade200,
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: BorderSide(color: Colors.grey, width: 0),
        // ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        //   borderSide: BorderSide(color: Colors.grey, width: 0),
        // ),
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        errorBorder: errorBorder,
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffixPassword,
              )
            : null,
        prefixIcon: prefix != null ? Icon(prefix) : null,
        label: Text(
          label,
          style: textStyLelabel,
        ),
      ),
    );

Widget editTextFormField({
  required TextEditingController controller,
  String? labelText,
  String? hintText,
  required TextInputType type,
  IconData? prefix,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
            prefixIcon: Icon(
              prefix,
            ),
            helperStyle: TextStyle(height: 100),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 0,
              ),
            ),
            labelText: labelText,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[700],
            )));

Widget elevatedItemBuilder({
  onPressed,
  required String text,
  double? width,
  required Color color,
}) =>
    ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
          backgroundColor: MaterialStateProperty.all<Color>(color),
          fixedSize: MaterialStateProperty.all<Size?>(Size(width!, 60.0)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 23.0),
        ));

Text text(String text, TextStyle style) => Text(
      text,
      style: style,
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false);

void navigatorTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
