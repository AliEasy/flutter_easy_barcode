import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Widget animatedListItem({required Widget child, required int position}) {
  return AnimationConfiguration.staggeredList(
    duration: const Duration(milliseconds: 375),
    position: position,
    child: SlideAnimation(
      verticalOffset: 50.0,
      child: FadeInAnimation(
        child: child,
      ),
    ),
  );
}
