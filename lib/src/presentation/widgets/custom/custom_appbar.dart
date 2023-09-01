import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  final String titleP;
  final Widget? leadingWidget;
  final List<Widget>? action;
  final TextStyle? labelStyle;

  @override
  final Color? backgroundColor;
  final bool? centerTitle2;
  CustomAppBar({
    Key? key,
    required this.titleP,
    this.leadingWidget,
    this.labelStyle,
    this.backgroundColor = Colors.white,
    this.action,
    this.centerTitle2,
  }) : super(
          key: key,
          actions: action ?? [],
          leading: leadingWidget ?? Container(),
          backgroundColor: backgroundColor,
          title: Text(titleP, style: labelStyle),
          centerTitle: centerTitle2,
          elevation: 2,
        );
}
