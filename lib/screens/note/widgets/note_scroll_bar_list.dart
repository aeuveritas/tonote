import 'package:flutter/material.dart';
import 'package:tonote/screens/note/note.dart';
import 'package:tonote/screens/note/widgets/note_tile.dart';
import 'package:tonote/screens/widgets/widgets.dart';

class NoteScrollBarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: ScraollBarList(
        tiles: List.generate(30, (int index) {
          if (index == 0) {
            return NoteTile(
              title: 'Create New Note',
              leadingIcon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  _routeToInProgress(),
                );
              },
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

  Route _routeToInProgress() {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          NoteInProgressContainer(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        final end = Offset.zero;
        final curve = Curves.ease;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
