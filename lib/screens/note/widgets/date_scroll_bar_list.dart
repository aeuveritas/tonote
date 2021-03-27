import 'package:flutter/material.dart';
import 'package:tonote/screens/note/widgets/date_tile.dart';
import 'package:tonote/screens/widgets/widgets.dart';

class DateScrollBarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: ScraollBarList(
        tiles: List.generate(30, (index) {
          final day = today.subtract(Duration(days: index));
          return DateTile(
            title: '${day.month}/${day.day}/${day.year}',
            onTap: () {},
          );
        }),
      ),
    );
  }
}
