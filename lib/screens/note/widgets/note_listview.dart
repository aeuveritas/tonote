import 'package:flutter/material.dart';
import 'package:tonote/screens/widgets/widgets.dart';

class NoteListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: ScrollListView(
        titles: List.generate(30, (_) {
          return 'Karl';
        }),
        tile: Tile.note,
      ),
    );
  }
}
