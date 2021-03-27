import 'package:flutter/material.dart';
import 'package:tonote/screens/widgets/widgets.dart';

import 'package:tonote/screens/note/widgets/widgets.dart';

class NoteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: VerticalSplit(
        ratio: 0.3,
        left: DateScrollBarList(),
        right: HorizontalSplit(
          ratio: 0.3,
          top: NoteScrollBarList(),
          bottom: Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: const Center(
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
