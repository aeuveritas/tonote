import 'package:flutter/material.dart';
import 'package:tonote/utils/consts.dart';

class DateButton extends StatelessWidget {
  final DateTime date;

  DateButton({@required this.date}) : assert(date != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: THEME_COLOR,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            '${date.month}/${date.day}/${date.year}',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
