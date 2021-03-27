import 'package:flutter/material.dart';
import 'package:tonote/utils/consts.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Icon? _leadingIcon;

  const NoteTile({
    required this.title,
    required this.onTap,
    Icon? leadingIcon,
  }) : _leadingIcon = leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Card(
        color: THEME_COLOR,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: ListTile(
          leading: _leadingIcon,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
