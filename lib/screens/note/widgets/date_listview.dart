import 'package:flutter/material.dart';
import 'package:tonote/screens/widgets/widgets.dart';

class DateListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: ScrollListView(
        titles: List.generate(30, (index) {
          final day = today.subtract(Duration(days: index));
          return '${day.month}/${day.day}/${day.year}';
        }),
        tile: Tile.date,
      ),
    );
  }
}