import 'package:flutter/material.dart';

import 'package:webscrollbar/webscrollbar.dart';

import 'package:tonote/screens/note/widgets/widgets.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    //Initialize the  scrollController
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: VerticalSplitView(
        ratio: 0.3,
        left: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: WebScrollBar(
            scrollbarColor: Colors.grey[100],
            scrollThumbColor: Colors.grey,
            visibleHeight: MediaQuery.of(context).size.height,
            controller: _controller,
            child: ListView.builder(
              controller: _controller,
              itemCount: 30,
              itemBuilder: (context, index) {
                return DateButton(date: today.subtract(Duration(days: index)));
              },
            ),
          ),
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
