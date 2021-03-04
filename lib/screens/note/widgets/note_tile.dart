import 'package:flutter/material.dart';
import 'package:tonote/utils/consts.dart';

class NoteTile extends StatelessWidget {
  final String title;
  NoteTile({required this.title}) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Card(
        color: THEME_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
