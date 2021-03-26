import 'package:flutter/material.dart';
import 'package:tonote/screens/note/note.dart';
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
          NoteInProgress(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
