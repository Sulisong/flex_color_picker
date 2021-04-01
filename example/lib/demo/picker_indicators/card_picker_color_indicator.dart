import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_const.dart';
import '../pods.dart';

@immutable
class CardPickerColorIndicator extends ConsumerWidget {
  const CardPickerColorIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return ListTile(
      title: const Text('Select color below to change this color'),
      subtitle: Text(
          '${ColorTools.materialNameAndARGBCode(watch(cardPickerColorPod).state, colorSwatchNameMap: AppConst.colorsNameMap)} '
          'aka ${ColorTools.nameThatColor(watch(cardPickerColorPod).state)}'),
      trailing: ColorIndicator(
        height: watch(sizePod).state,
        width: watch(sizePod).state,
        borderRadius: watch(borderRadiusPod).state,
        elevation: watch(elevationPod).state,
        color: watch(cardPickerColorPod).state,
        hasBorder: watch(hasBorderPod).state,
      ),
    );
  }
}
