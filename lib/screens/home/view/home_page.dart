import 'package:flutter/material.dart';
import 'package:tonote/screens/note/note.dart';
import 'package:tonote/screens/home/widgets/tab_button.dart';
import 'package:tonote/screens/home/widgets/widgets.dart';
import 'package:tonote/utils/consts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Note'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.bookmark),
                label: Text('ToDo'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Calendar'),
              ),
            ],
          ),
          VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  getSearchBar(),
                  getBoard(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getBoard() {
    Widget board;
    switch (_selectedIndex) {
      case 0:
        board = NotePage();
        break;
      case 1:
        board = Container();
        break;
      case 2:
        board = Container();
        break;
      default:
        board = Center(
          child: CircularProgressIndicator(),
        );
    }

    return Expanded(
      child: board,
    );
  }

  Widget getSearchBar() {
    return Container(
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: 'Search...',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Search'),
            ),
          ),
        ],
      ),
    );
  }
}
