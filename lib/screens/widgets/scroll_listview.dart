import 'package:flutter/material.dart';
import 'package:tonote/screens/note/widgets/widgets.dart';

enum Tile { date, note }

class ScrollListView extends StatefulWidget {
  final List<String> titles;
  final Tile tile;

  const ScrollListView({
    Key? key,
    required this.titles,
    required this.tile,
  })   : assert(titles != null),
        assert(tile != null),
        super(key: key);

  @override
  _ScrollListViewState createState() => _ScrollListViewState();
}

class _ScrollListViewState extends State<ScrollListView> {
  ScrollController? _controller;
  GlobalKey? _keyContainer;
  double? _containerHeight;

  @override
  void initState() {
    _controller = ScrollController();
    _keyContainer = GlobalKey();
    _containerHeight = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _keyContainer,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Scrollbar(
        isAlwaysShown: true,
        showTrackOnHover: true,
        controller: _controller,
        child: ListView.builder(
          controller: _controller,
          itemCount: widget.titles.length,
          itemBuilder: (context, index) {
            switch (widget.tile) {
              case Tile.date:
                return DateTile(title: widget.titles[index]);
              case Tile.note:
                return NoteTile(title: widget.titles[index]);
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
