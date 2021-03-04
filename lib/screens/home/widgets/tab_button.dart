import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String? title;

  const TabButton({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "$title",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
