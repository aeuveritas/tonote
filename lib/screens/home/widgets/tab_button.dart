import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String title;

  const TabButton({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "$title",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
