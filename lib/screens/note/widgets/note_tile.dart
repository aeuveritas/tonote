import 'package:flutter/material.dart';
import 'package:tonote/utils/consts.dart';

class NoteTile extends StatelessWidget {
  final String title;
  NoteTile({@required this.title}) : assert(title != null);

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
            title,
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
