import 'package:flutter/material.dart';

/// Секція з чотирма слайдерами (TL, TR, BL, BR).
class RadiusSliders extends StatelessWidget {
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final ValueChanged<double> onTopLeftChanged;
  final ValueChanged<double> onTopRightChanged;
  final ValueChanged<double> onBottomLeftChanged;
  final ValueChanged<double> onBottomRightChanged;

  const RadiusSliders({
    super.key,
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
    required this.onTopLeftChanged,
    required this.onTopRightChanged,
    required this.onBottomLeftChanged,
    required this.onBottomRightChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _RadiusSlider(
                label: 'TL',
                value: topLeft,
                onChanged: onTopLeftChanged,
              ),
            ),
            Expanded(
              child: _RadiusSlider(
                label: 'TR',
                value: topRight,
                onChanged: onTopRightChanged,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _RadiusSlider(
                label: 'BL',
                value: bottomLeft,
                onChanged: onBottomLeftChanged,
              ),
            ),
            Expanded(
              child: _RadiusSlider(
                label: 'BR',
                value: bottomRight,
                onChanged: onBottomRightChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Один слайдер із підписом: "TL: 56.02".
class _RadiusSlider extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  const _RadiusSlider({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: '$label: ',
            children: [
              TextSpan(
                text: value.toStringAsFixed(2),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Slider(
          value: value,
          min: 0,
          max: 100,
          onChanged: onChanged,
        ),
      ],
    );
  }
}