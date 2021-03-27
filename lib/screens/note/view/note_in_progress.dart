import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:tonote/screens/note/bloc/updater_bloc.dart';
import 'package:tonote/screens/widgets/widgets.dart';

class NoteInProgressContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ticker = Ticker();
    return BlocProvider(
      create: (context) => UpdaterBloc(ticker: ticker),
      child: NoteInProgress(),
    );
  }
}

class NoteInProgress extends StatefulWidget {
  @override
  _NoteInProgressState createState() => _NoteInProgressState();
}

class _NoteInProgressState extends State<NoteInProgress> {
  final _inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
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
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: VerticalSplit(
            left: BlocListener<UpdaterBloc, UpdaterState>(
              listenWhen: (previous, current) {
                if (current.content != _inputController.text) {
                  return true;
                }
                return false;
              },
              listener: (context, state) {
                if (state.status == UpdaterStatus.inProgress) {
                  context
                      .read<UpdaterBloc>()
                      .add(UpdaterContent(content: _inputController.text));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Scrollbar(
                    isAlwaysShown: true,
                    showTrackOnHover: true,
                    child: TextField(
                      controller: _inputController,
                      maxLines: null,
                      expands: true,
                      autocorrect: false,
                      enableSuggestions: false,
                    ),
                  ),
                ),
              ),
            ),
            right: BlocBuilder<UpdaterBloc, UpdaterState>(
              builder: (context, state) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Scrollbar(
                    isAlwaysShown: true,
                    showTrackOnHover: true,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Html(
                        data: state.htmlContent,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
