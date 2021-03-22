import 'package:flutter/material.dart';
import 'package:tonote/screens/note/widgets/note_tile.dart';
import 'package:tonote/screens/widgets/widgets.dart';

class NoteScrollBarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: ScraollBarList(
        tiles: List.generate(30, (int index) {
          if (index == 0) {
            return NoteTile(
              title: 'Create New Note',
              leadingIcon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onTap: () {},
            );
          }
          return NoteTile(
            title: 'Karl',
            onTap: () {},
          );
        }),
      ),
    );
  }
}
