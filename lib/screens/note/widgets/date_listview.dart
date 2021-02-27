import 'package:flutter/material.dart';
import 'package:tonote/screens/note/widgets/widgets.dart';
import 'package:webscrollbar/webscrollbar.dart';

class DateListView extends StatefulWidget {
  const DateListView({
    Key key,
  });

  @override
  _DateListViewState createState() => _DateListViewState();
}

class _DateListViewState extends State<DateListView> {
  ScrollController _controller;

  @override
  void initState() {
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
    return Container(
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
    );
  }
}
