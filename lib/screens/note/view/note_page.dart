import 'package:flutter/material.dart';
import 'package:tonote/screens/note/widgets/widgets.dart';

class NotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: VerticalSplitView(
        ratio: 0.3,
        left: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Center(
              child: FlutterLogo(
            size: 256,
          )),
        ),
        right: Container(
          child: HorizontalSplitView(
            ratio: 0.3,
            top: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                  child: FlutterLogo(
                size: 256,
              )),
            ),
            bottom: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: FlutterLogo(
                  size: 256,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
