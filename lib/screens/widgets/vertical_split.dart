import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class VerticalSplit extends StatefulWidget {
  final Widget left;
  final Widget right;
  final double ratio;
  final bool isFixed;

  const VerticalSplit({
    Key? key,
    required this.left,
    required this.right,
    this.ratio = 0.5,
    this.isFixed = false,
  })  : assert(ratio >= 0),
        assert(ratio <= 1),
        super(key: key);

  @override
  _VerticalSplitState createState() => _VerticalSplitState();
}

class _VerticalSplitState extends State<VerticalSplit> {
  final _dividerWidth = 16.0;

  //from 0-1
  late double _ratio;
  double _maxWidth = 0;

  double get _width1 => _ratio * _maxWidth;

  double get _width2 => (1 - _ratio) * _maxWidth;

  @override
  void initState() {
    super.initState();
    _ratio = widget.ratio;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(_ratio <= 1);
        assert(_ratio >= 0);
        if (_maxWidth == 0) {
          _maxWidth = constraints.maxWidth - _dividerWidth;
        }
        if (_maxWidth != constraints.maxWidth) {
          _maxWidth = constraints.maxWidth - _dividerWidth;
        }

        return SizedBox(
          width: constraints.maxWidth,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: _width1,
                child: widget.left,
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanUpdate: widget.isFixed
                    ? null
                    : (DragUpdateDetails details) {
                        setState(() {
                          _ratio += details.delta.dx / _maxWidth;
                          if (_ratio > 0.9) {
                            _ratio = 0.9;
                          } else if (_ratio < 0.1) _ratio = 0.1;
                        });
                      },
                child: SizedBox(
                  width: _dividerWidth,
                  height: constraints.maxHeight,
                  child: widget.isFixed
                      ? Container()
                      : const RotationTransition(
                          turns: AlwaysStoppedAnimation(0.25),
                          child: Icon(FontAwesomeIcons.gripLines),
                        ),
                ),
              ),
              SizedBox(
                width: _width2,
                child: widget.right,
              ),
            ],
          ),
        );
      },
    );
  }
}
