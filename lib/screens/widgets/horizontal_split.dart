import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class HorizontalSplit extends StatefulWidget {
  final Widget top;
  final Widget bottom;
  final double ratio;
  final bool isFixed;

  const HorizontalSplit({
    Key? key,
    required this.top,
    required this.bottom,
    this.ratio = 0.5,
    this.isFixed = false,
  })  : assert(ratio >= 0),
        assert(ratio <= 1),
        super(key: key);

  @override
  _HorizontalSplitState createState() => _HorizontalSplitState();
}

class _HorizontalSplitState extends State<HorizontalSplit> {
  final _dividerHeight = 16.0;

  //from 0-1
  late double _ratio;
  double _maxHeight = 0;

  double get _height1 => _ratio * _maxHeight;

  double get _height2 => (1 - _ratio) * _maxHeight;

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
        if (_maxHeight == 0) {
          _maxHeight = constraints.maxHeight - _dividerHeight;
        }
        if (_maxHeight != constraints.maxHeight) {
          _maxHeight = constraints.maxHeight - _dividerHeight;
        }

        return SizedBox(
          height: constraints.maxHeight,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: _height1,
                child: widget.top,
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanUpdate: widget.isFixed
                    ? null
                    : (DragUpdateDetails details) {
                        setState(() {
                          _ratio += details.delta.dy / _maxHeight;
                          if (_ratio > 0.9) {
                            _ratio = 0.9;
                          } else if (_ratio < 0.1) _ratio = 0.1;
                        });
                      },
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: _dividerHeight,
                  child: widget.isFixed
                      ? Container()
                      : const RotationTransition(
                          turns: AlwaysStoppedAnimation(0.25),
                          child: Icon(FontAwesomeIcons.gripLinesVertical),
                        ),
                ),
              ),
              SizedBox(
                height: _height2,
                child: widget.bottom,
              ),
            ],
          ),
        );
      },
    );
  }
}
