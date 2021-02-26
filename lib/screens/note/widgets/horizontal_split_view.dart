import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class HorizontalSplitView extends StatefulWidget {
  final Widget top;
  final Widget bottom;
  final double ratio;

  const HorizontalSplitView(
      {Key key, @required this.top, @required this.bottom, this.ratio = 0.5})
      : assert(top != null),
        assert(bottom != null),
        assert(ratio >= 0),
        assert(ratio <= 1),
        super(key: key);

  @override
  _HorizontalSplitViewState createState() => _HorizontalSplitViewState();
}

class _HorizontalSplitViewState extends State<HorizontalSplitView> {
  final _dividerHeight = 16.0;

  //from 0-1
  double _ratio;
  double _maxHeight;

  get _height1 => _ratio * _maxHeight;

  get _height2 => (1 - _ratio) * _maxHeight;

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
        if (_maxHeight == null)
          _maxHeight = constraints.maxHeight - _dividerHeight;
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
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: _dividerHeight,
                  child: RotationTransition(
                    child: Icon(CommunityMaterialIcons.drag_vertical_variant),
                    turns: AlwaysStoppedAnimation(0.25),
                  ),
                ),
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _ratio += details.delta.dy / _maxHeight;
                    if (_ratio > 0.9)
                      _ratio = 0.9;
                    else if (_ratio < 0.1) _ratio = 0.1;
                  });
                },
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
