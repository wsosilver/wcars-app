import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({
    super.key,
    required this.titulo,
    this.action,
    required this.heightSize,
    this.centerTitle = false,
    this.automaticallyImplyLeading = false,
  });
  final Widget? titulo;
  final List<Widget>? action;
  final double heightSize;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: widget.heightSize,
      elevation: 0,
      centerTitle: widget.centerTitle,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      title: widget.titulo,
      actions: widget.action,
    );
  }
}
