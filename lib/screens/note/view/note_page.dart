import 'package:flutter/material.dart';
import 'package:tonote/screens/widgets/widgets.dart';

import 'package:tonote/screens/note/widgets/widgets.dart';

class NotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: VerticalSplitView(
        ratio: 0.3,
        left: DateListView(),
        right: HorizontalSplitView(
          ratio: 0.3,
          top: NoteListView(),
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
    );
  }
}
