// onboarding_indicator.dart

import 'package:flutter/material.dart';

import '../../smart_onboarding.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int totalCount;
  final IndicatorStyle style;
  final Color? activeColor;
  final Color? inactiveColor;
  final double activeSize;
  final double inactiveSize;
  final double spacing;

  const OnboardingIndicator({
    super.key,
    required this.currentIndex,
    required this.totalCount,
    this.style = IndicatorStyle.circle,
    this.activeColor,
    this.inactiveColor = Colors.grey,
    this.activeSize = 12.0,
    this.inactiveSize = 10,
    this.spacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalCount, (index) {
        final bool isActive = index == currentIndex;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing / 2),
          child: _buildIndicator(isActive),
        );
      }),
    );
  }

  Widget _buildIndicator(bool isActive) {
    final size = isActive ? activeSize : inactiveSize;
    final color = isActive ? activeColor : inactiveColor;

    switch (style) {
      case IndicatorStyle.rectangle:
        return Container(
          width: size * 1.5,
          height: size,
          decoration: BoxDecoration(color: color, shape: BoxShape.rectangle),
        );
      case IndicatorStyle.roundedRectangle:
        return Container(
          width: size * 1.5,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      case IndicatorStyle.dash:
        return Container(
          width: size * 2,
          height: size / 2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        );
      case IndicatorStyle.diamond:
        return Transform.rotate(
          angle: 0.785398, // 45 degrees in radians
          child: Container(width: size, height: size, color: color),
        );
      case IndicatorStyle.triangle:
        return CustomPaint(
          size: Size(size, size),
          painter: _TrianglePainter(color: color!),
        );
      case IndicatorStyle.circle:
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        );
    }
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;
  _TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final Path path =
        Path()
          ..moveTo(size.width / 2, 0)
          ..lineTo(0, size.height)
          ..lineTo(size.width, size.height)
          ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
