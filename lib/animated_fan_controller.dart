import 'dart:math';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

class AnimatedFanController extends StatefulWidget {
  const AnimatedFanController({Key? key}) : super(key: key);

  @override
  State<AnimatedFanController> createState() => _AnimatedFanControllerState();
}

class _AnimatedFanControllerState extends State<AnimatedFanController>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Fan Controller'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Widget-based'),
            Tab(text: 'Canvas-based'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _WidgetBasedAnimatedFanController(),
          _CanvasBasedAnimatedFanController(),
        ],
      ),
    );
  }
}

const buttonOffColor = Colors.grey;
const buttonHighColor = Colors.red;

const labels = ['0', '1', '2', '3'];
const labelSize = 40.0;
const labelFontSize = labelSize * .6;
const totalAngleUsedByLabels = 2 * pi / 3;
const spaceBetweenLabels = totalAngleUsedByLabels / 3;
const labelsCenterPositionAngle = 0;
const labelsStartPositionAngle =
    labelsCenterPositionAngle + totalAngleUsedByLabels / 2;

const pointerSize = 30.0;
const pointerColor = Color(0x55FFFFFF);

class _WidgetBasedAnimatedFanController extends StatefulWidget {
  const _WidgetBasedAnimatedFanController({Key? key}) : super(key: key);

  @override
  State<_WidgetBasedAnimatedFanController> createState() =>
      _WidgetBasedAnimatedFanControllerState();
}

class _WidgetBasedAnimatedFanControllerState
    extends State<_WidgetBasedAnimatedFanController>
    with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
    vsync: this,
    lowerBound: FanSpeed.off.index.toDouble(),
    upperBound: FanSpeed.high.index.toDouble(),
    duration: const Duration(milliseconds: 300),
  );
  FanSpeed _fanSpeed = FanSpeed.off;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        final size = min(constraints.maxHeight, constraints.maxWidth) * .75;
        final radius = size / 2;

        final labelWidgets = <Widget>[];
        for (int i = 0; i < labels.length; i++) {
          labelWidgets.add(_buildPositionedLabel(
            labels[i],
            index: i,
            buttonRadius: radius,
          ));
        }

        return ValueListenableBuilder<double>(
            valueListenable: _animationController,
            builder: (context, animationProgress, _) {
              final button = Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size),
                  color: Color.lerp(
                    buttonOffColor,
                    buttonHighColor,
                    animationProgress / (FanSpeed.values.length - 1),
                  ),
                ),
              );
              final buttonPointer = _buildPositionedPointer(
                buttonRadius: radius,
                progress: animationProgress,
              );

              final inkWell = Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(radius),
                    onTap: _goToNextSpeed,
                  ),
                ),
              );

              return Stack(
                clipBehavior: Clip.none,
                children: [button, ...labelWidgets, buttonPointer, inkWell],
              );
            });
      }),
    );
  }

  void _goToNextSpeed() {
    _fanSpeed = _fanSpeed.next();
    _animationController.animateTo(_fanSpeed.index.toDouble());
  }

  Widget _buildPositionedLabel(
    String label, {
    required int index,
    required double buttonRadius,
  }) {
    final position = _calculateLabelPosition(
      buttonRadius: buttonRadius,
      labelSize: labelSize,
      index: index,
    );

    return Positioned(
      top: position.y,
      left: position.x,
      child: SizedBox(
        height: labelSize,
        width: labelSize,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: labelFontSize),
          ),
        ),
      ),
    );
  }

  Widget _buildPositionedPointer({
    required double buttonRadius,
    required double progress,
  }) {
    final position = _calculatePointerPosition(
      buttonRadius: buttonRadius,
      position: progress,
    );

    return Positioned(
      top: position.y,
      left: position.x,
      child: Container(
        width: pointerSize,
        height: pointerSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(pointerSize),
          color: pointerColor,
        ),
      ),
    );
  }
}

class _CanvasBasedAnimatedFanController extends StatefulWidget {
  const _CanvasBasedAnimatedFanController({Key? key}) : super(key: key);

  @override
  State<_CanvasBasedAnimatedFanController> createState() =>
      _CanvasBasedAnimatedFanControllerState();
}

class _CanvasBasedAnimatedFanControllerState
    extends State<_CanvasBasedAnimatedFanController>
    with SingleTickerProviderStateMixin {
  FanSpeed _fanSpeed = FanSpeed.off;
  late final _animationController = AnimationController(
    vsync: this,
    lowerBound: FanSpeed.off.index.toDouble(),
    upperBound: FanSpeed.high.index.toDouble(),
    duration: const Duration(milliseconds: 300),
  );

  @override
  Widget build(BuildContext context) {
    return Center(child: LayoutBuilder(
      builder: (context, constraints) {
        final size = min(constraints.maxHeight, constraints.maxWidth) * .75;

        return Stack(
          children: [
            ValueListenableBuilder<double>(
                valueListenable: _animationController,
                builder: (_, speed, __) => CustomPaint(
                      size: Size(size, size),
                      painter: _FanControllerPainter(
                        size: size,
                        speed: speed,
                      ),
                    )),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(size / 2),
                  onTap: _goToNextSpeed,
                ),
              ),
            ),
          ],
        );
      },
    ));
  }

  void _goToNextSpeed() {
    _fanSpeed = _fanSpeed.next();
    _animationController.animateTo(_fanSpeed.index.toDouble());
  }
}

class _FanControllerPainter extends CustomPainter with EquatableMixin {
  final double size;
  final double speed;
  late final radius = size / 2;

  _FanControllerPainter({required this.size, required this.speed});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final color = Color.lerp(
      buttonOffColor,
      buttonHighColor,
      speed / FanSpeed.values.length,
    )!;
    canvas.drawCircle(center, radius, Paint()..color = color);

    for (int i = 0; i < labels.length; i++) {
      final label = labels[i];
      final position = _calculateLabelPosition(
        buttonRadius: radius,
        labelSize: labelSize,
        index: i,
      );
      final textSpan = TextSpan(
        text: label,
        style: const TextStyle(fontSize: labelFontSize, color: Colors.black),
      );
      TextPainter painter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      painter.layout();
      painter.paint(canvas, Offset(position.x + labelSize * .4, position.y));
    }
    final pointerPosition = _calculatePointerPosition(
      buttonRadius: radius,
      position: speed,
      center: false,
    );
    canvas.drawCircle(
      Offset(pointerPosition.x, pointerPosition.y),
      pointerSize / 2,
      Paint()..color = pointerColor,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

  @override
  List<Object?> get props => [size, speed];
}

enum FanSpeed { off, low, medium, high }

extension on FanSpeed {
  FanSpeed next() {
    switch (this) {
      case FanSpeed.off:
        return FanSpeed.low;
      case FanSpeed.low:
        return FanSpeed.medium;
      case FanSpeed.medium:
        return FanSpeed.high;
      case FanSpeed.high:
        return FanSpeed.off;
    }
  }
}

Point<double> _calculateLabelPosition(
    {required double buttonRadius,
    required double labelSize,
    required int index,
    bool center = true}) {
  final buttonCenter = buttonRadius;
  final labelAngle = labelsStartPositionAngle - index * spaceBetweenLabels;
  // A circle bigger than the button, so that the labels are around the button
  final labelCircleRadius = buttonRadius + labelSize / 2;

  var y = buttonCenter - labelCircleRadius * cos(labelAngle);
  if (center) {
    y -= labelSize / 2;
  }
  var x = buttonCenter - labelCircleRadius * sin(labelAngle);
  if (center) {
    x -= labelSize / 2;
  }

  return Point(x, y);
}

Point<double> _calculatePointerPosition(
    {required double buttonRadius,
    required double position,
    bool center = true}) {
  final buttonCenter = buttonRadius;
  final pointerCircleRadius = buttonRadius - pointerSize;
  final pointerAngle = labelsStartPositionAngle - position * spaceBetweenLabels;

  var y = buttonCenter - pointerCircleRadius * cos(pointerAngle);
  if (center) {
    y -= pointerSize / 2;
  }
  var x = buttonCenter - pointerCircleRadius * sin(pointerAngle);
  if (center) {
    x -= pointerSize / 2;
  }
  return Point(x, y);
}
