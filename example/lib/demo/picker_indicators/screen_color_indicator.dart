import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_const.dart';
import '../pods.dart';

@immutable
class ScreenColorIndicator extends ConsumerWidget {
  const ScreenColorIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return ListTile(
      title: const Text('Select color below to change this color'),
      subtitle: Text(
          '${ColorTools.materialNameAndARGBCode(watch(screenPickerColorPod).state, colorSwatchNameMap: App.colorsNameMap2)} '
          'aka ${ColorTools.nameThatColor(watch(screenPickerColorPod).state)}'),
      trailing: ColorIndicator(
        height: watch(sizePod).state,
        width: watch(sizePod).state,
        borderRadius: watch(borderRadiusPod).state,
        elevation: watch(elevationPod).state,
        color: watch(screenPickerColorPod).state,
        hasBorder: watch(hasBorderPod).state,
      ),
    );
  }
}
