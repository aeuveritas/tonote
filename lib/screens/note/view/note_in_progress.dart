import 'package:flutter/material.dart';
import 'package:tonote/screens/widgets/widgets.dart';

class NoteInProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
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
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('Save'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: VerticalSplit(
          ratio: 0.5,
          left: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              border: Border.all(color: Colors.black),
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
