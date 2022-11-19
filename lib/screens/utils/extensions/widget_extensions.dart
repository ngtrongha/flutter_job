import 'package:flutter/material.dart';

extension WidgetAppExt on Widget {
  Widget gestureDetector({
    required VoidCallback onTap,
    HitTestBehavior? behavior = HitTestBehavior.translucent,
  }) =>
      GestureDetector(
        behavior: behavior,
        onTap: onTap,
        child: this,
      );

  Widget mouseRegion({
    required VoidCallback onTap,
    HitTestBehavior? behavior = HitTestBehavior.translucent,
    MouseCursor cursor = SystemMouseCursors.click,
  }) =>
      MouseRegion(
        cursor: cursor,
        child: GestureDetector(
          behavior: behavior,
          onTap: onTap,
          child: this,
        ),
      );

  Widget expanded([int flex = 1]) => Expanded(
        flex: flex,
        child: this,
      );

  Widget scrollable(ScrollPhysics? physics) => SingleChildScrollView(
        physics: physics,
        child: this,
      );

  Widget positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      Positioned(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: this,
      );

  Widget positionedFill({AlignmentGeometry? alignment}) => Positioned.fill(
          child: Align(
        alignment: alignment ?? Alignment.center,
        child: this,
      ));
}
