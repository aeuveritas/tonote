import 'package:flutter/material.dart';

class ScraollBarList extends StatefulWidget {
  final List<Widget> tiles;

  const ScraollBarList({
    Key? key,
    required this.tiles,
  }) : super(key: key);

  @override
  _ScraollBarListState createState() => _ScraollBarListState();
}

class _ScraollBarListState extends State<ScraollBarList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Scrollbar(
        isAlwaysShown: true,
        showTrackOnHover: true,
        child: ListView.builder(
          itemCount: widget.tiles.length,
          itemBuilder: (context, index) {
            return widget.tiles[index];
          },
        ),
      ),
    );
  }
}
