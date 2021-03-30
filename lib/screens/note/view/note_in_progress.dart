import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_html_css/simple_html_css.dart';
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
                // height: double.infinity,
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
                // TODO: Select one of flutter_web, easy_web_view or simple_html_css
                // TODO: CSS will be a class or map, and it will be given to HTML widget.
                final TextSpan textSpan = HTML.toTextSpan(
                  context,
                  state.htmlContent,
                );
                return Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Scrollbar(
                    isAlwaysShown: true,
                    showTrackOnHover: true,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: textSpan,
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
