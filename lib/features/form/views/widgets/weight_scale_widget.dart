import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
enum WeightType {
  kg,
  lb,
}

extension WeightTypeExtension on WeightType {
  String get name {
    switch (this) {
      case WeightType.kg:
        return 'kg';
      case WeightType.lb:
        return 'lb';
    }
  }
}
class WeightSelector extends StatefulWidget {
  final WeightType initialWeightType;
  final double initialWeight;
  final ValueChanged<double> onWeightChanged;
  final ValueChanged<WeightType> onTypeChanged;

  const WeightSelector({
    required this.initialWeightType,
    required this.initialWeight,
    super.key,
    required this.onWeightChanged,
    required this.onTypeChanged,
  });

  @override
  State<WeightSelector> createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {
  late WeightType weightType;
  late double weight;

  @override
  void initState() {
    super.initState();
    weightType = widget.initialWeightType;
    weight = widget.initialWeight;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Header(
                weightType: weightType,
                inKg: weight,
              ),
              _Switcher(
                weightType: weightType,
                onChanged: (type) {
                  weightType = type;
                  widget.onTypeChanged(type);
                } ,
              ),
            ],
          ),
          Expanded(
            child: DivisionSlider(
              from: 0,
              max: 300,
              initialValue: weight,
              type: weightType,
              onChanged: (value) {
                weight = value;
                widget.onWeightChanged(value);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.weightType,
    required this.inKg,
  });

  final WeightType weightType;
  final double inKg;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReusableText(text: 'Weight',
              size: 18, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}


class _Switcher extends StatelessWidget {
  final WeightType weightType;
  final ValueChanged<WeightType> onChanged;
  const _Switcher({
    required this.weightType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            top: 2,
            width: 50,
            height: 26,
            left: weightType == WeightType.kg ? 2 : 48,
            duration: const Duration(milliseconds: 300),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Positioned.fill(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildButton(WeightType.kg),
                  _buildButton(WeightType.lb)
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildButton(WeightType type) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onChanged(type),
        child: Center(
          child: Text(
            type.name,
            style: const TextStyle(fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class DivisionSlider extends StatefulWidget {
  final double from;
  final double max;
  final double initialValue;
  final Function(double) onChanged;
  final WeightType type;

  const DivisionSlider({
    required this.from,
    required this.max,
    required this.initialValue,
    required this.onChanged,
    required this.type,
    super.key,
  });

  @override
  State<DivisionSlider> createState() => _DivisionSliderState();
}

class _DivisionSliderState extends State<DivisionSlider> {
  PageController? numbersController;
  final itemsExtension = 10000;
  late double value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  void _updateValue() {
    value = ((((numbersController?.page ?? 0) - itemsExtension) * 10)
        .roundToDouble() /
        10)
        .clamp(widget.from, widget.max);
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.initialValue >= widget.from &&
        widget.initialValue <= widget.max);
    return Container(
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final viewPortFraction = 1 / (constraints.maxWidth / 10);
          numbersController = PageController(
            initialPage: itemsExtension + widget.initialValue.toInt(),
            viewportFraction: viewPortFraction * 10,
          );
          numbersController?.addListener(_updateValue);
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              ReusableText(
                text:  '$value ${widget.type.name}',
                size: 28,
                fontWeight: FontWeight.w600,
                color: greenColor,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 10,
                width: 11.5,
                child: CustomPaint(
                  painter: TrianglePainter(),
                ),
              ),
              _Numbers(
                itemsExtension: itemsExtension,
                controller: numbersController,
                start: widget.from.toInt(),
                end: widget.max.toInt(),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    numbersController?.removeListener(_updateValue);
    numbersController?.dispose();
    super.dispose();
  }
}

class TrianglePainter extends CustomPainter {
  TrianglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint2 = Paint()
      ..color = greenColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawPath(line(size.width, size.height), paint2);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..lineTo(x, 0)
      ..lineTo(x / 2, y)
      ..lineTo(0, 0);
  }

  Path line(double x, double y) {
    return Path()
      ..moveTo(x / 2, 0)
      ..lineTo(x / 2, y * 6);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return true;
  }
}

const greenColor = Color(0xff90D855);

class _Numbers extends StatelessWidget {
  final PageController? controller;
  final int itemsExtension;
  final int start;
  final int end;

  const _Numbers({
    required this.controller,
    required this.itemsExtension,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: PageView.builder(
        pageSnapping: false,
        controller: controller,
        physics: _CustomPageScrollPhysics(
          start: itemsExtension + start.toDouble(),
          end: itemsExtension + end.toDouble(),
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, rawIndex) {
          final index = rawIndex - itemsExtension;
          return _Item(index: index >= start && index <= end ? index : null);
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final int? index;

  const _Item({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          index != null?
          Expanded(
            child: Center(
              child: ReusableText(
                text: '$index',
                fontWeight: FontWeight.w500,
                size: 12,
                color: Colors.grey,
              ),
            ),
          ):const Expanded(
            child: Center(
              child: ReusableText(
                text: '',
                fontWeight: FontWeight.w500,
                size: 12,
                color: Colors.grey,
              ),
            ),
          ),
          const _Dividers(),

        ],
      ),
    );
  }
}

class _Dividers extends StatelessWidget {
  const _Dividers();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(10, (index) {
          final thickness = index == 5 ? 1.5 : 0.5;
          return Expanded(
            child: Row(
              children: [
                Transform.translate(
                  offset: Offset(-thickness / 2, 1),
                  child: Container(
                    height: index == 5 ? 25 :14,
                    width: index == 5 ? 2:1,
                    color: index == 5 ? Colors.grey : AppColors.kLightGreyColor,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _CustomPageScrollPhysics extends ScrollPhysics {
  final double start;
  final double end;

  const _CustomPageScrollPhysics({
    required this.start,
    required this.end,
    super.parent,
  });

  @override
  _CustomPageScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _CustomPageScrollPhysics(
      parent: buildParent(ancestor),
      start: start,
      end: end,
    );
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position,
      double velocity,
      ) {
    final oldPosition = position.pixels;
    final frictionSimulation =
    FrictionSimulation(0.4, position.pixels, velocity * 0.2);

    double newPosition = (frictionSimulation.finalX / 10).round() * 10;

    final endPosition = end * 10 * 10;
    final startPosition = start * 10 * 10;
    if (newPosition > endPosition) {
      newPosition = endPosition;
    } else if (newPosition < startPosition) {
      newPosition = startPosition;
    }
    if (oldPosition == newPosition) {
      return null;
    }
    return ScrollSpringSimulation(
      spring,
      position.pixels,
      newPosition.toDouble(),
      velocity,
      tolerance: tolerance,
    );
  }

  @override
  SpringDescription get spring => const SpringDescription(
    mass: 20,
    stiffness: 100,
    damping: 0.8,
  );
}