import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.leading,
    required this.title,
    this.trailing,
  }) : super(key: key);
  final Widget? leading;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: ListTile(
          dense: true,
          contentPadding: const EdgeInsets.all(0.0),
          leading: leading,
          title: Text(
            title,
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
          trailing: trailing,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
