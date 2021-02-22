import 'package:flutter/material.dart';
import 'package:tonote/screens/home/widgets/tab_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "ToNote",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
          bottom: TabBar(
            unselectedLabelColor: Colors.redAccent,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.redAccent,
            ),
            tabs: [
              TabButton(title: 'Calendar'),
              TabButton(title: 'To Do'),
              TabButton(title: 'Note'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
