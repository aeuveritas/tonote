import 'package:flutter/material.dart';
import 'package:tonote/screens/note/note.dart';
import 'package:tonote/screens/home/widgets/tab_button.dart';
import 'package:tonote/screens/home/widgets/widgets.dart';
import 'package:tonote/utils/consts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: THEME_COLOR,
          elevation: 0,
          flexibleSpace: SafeArea(
            minimum: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: TabBar(
              labelColor: THEME_COLOR,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
              ),
              tabs: [
                TabButton(title: 'Note'),
                TabButton(title: 'Calendar'),
                TabButton(title: 'To Do'),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              NotePage(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
