import 'package:flutter/material.dart';
import 'package:tonote/utils/consts.dart';

class DateTile extends StatelessWidget {
  final String title;
  final Function()? onTap;

  DateTile({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Card(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: THEME_COLOR,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
