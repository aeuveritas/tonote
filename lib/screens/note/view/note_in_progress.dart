import 'package:flutter/material.dart';
import 'package:tonote/screens/widgets/widgets.dart';

class NoteInProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Type title',
          ),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: VerticalSplit(
          left: Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Scrollbar(
                isAlwaysShown: true,
                showTrackOnHover: true,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  autocorrect: false,
                  enableSuggestions: false,
                ),
              ),
            ),
          ),
          right: Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Scrollbar(
              isAlwaysShown: true,
              showTrackOnHover: true,
              child: Container(),
            ),
          ),
        ),
      ),
    );
  }
}
