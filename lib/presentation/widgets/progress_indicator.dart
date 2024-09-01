import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// A custom progress indicator widget that displays a loading animation.
///
/// This widget uses the [LoadingAnimationWidget] to show a circular loading animation with three arches.
///
/// * [color]: The color of the loading animation. If not provided, it defaults to [Colors.black].
/// * [size]: The size of the loading animation in pixels. If not provided, it defaults to 20 pixels.
///
/// Returns a [Widget] that displays a three-arched circular loading animation.
class CustomProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? size;

  const CustomProgressIndicator({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.threeArchedCircle(
      color: color ?? Colors.black,
      size: size ?? 20,
    );
  }
}

