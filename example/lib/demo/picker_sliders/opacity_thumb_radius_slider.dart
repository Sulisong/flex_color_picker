import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../maybe_tooltip.dart';
import '../pods.dart';

@immutable
class OpacityThumbRadiusSlider extends ConsumerWidget {
  const OpacityThumbRadiusSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaybeTooltip(
      condition: watch(enableTooltipsPod).state,
      tooltip: 'ColorPicker(opacityThumbRadius: '
          '${context.read(opacityThumbRadiusPod).state.floor().toString()})',
      child: ListTile(
        title: const Text('Opacity slider thumb radius'),
        subtitle: Slider.adaptive(
          min: 12,
          max: 30,
          divisions: 30 - 12,
          label: context.read(opacityThumbRadiusPod).state.floor().toString(),
          value: watch(opacityThumbRadiusPod).state,
          onChanged: (double value) =>
              context.read(opacityThumbRadiusPod).state = value,
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const Text(
                'dp',
                style: TextStyle(fontSize: 11),
              ),
              Text(
                context.read(opacityThumbRadiusPod).state.floor().toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
