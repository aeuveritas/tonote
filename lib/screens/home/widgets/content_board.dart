import 'package:flutter/material.dart';
import 'package:tonote/screens/note/note.dart';

class ContentBoard extends StatelessWidget {
  final int _selectedBoard;

  const ContentBoard({Key? key, required int selectedBoard})
      : _selectedBoard = selectedBoard,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget board;
    switch (_selectedBoard) {
      case 0:
        board = NoteView();
        break;
      case 1:
        board = Container();
        break;
      case 2:
        board = Container();
        break;
      default:
        board = const Center(
          child: CircularProgressIndicator(),
        );
    }

    return Expanded(
      child: board,
    );
  }
}
