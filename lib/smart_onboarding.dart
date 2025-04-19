library;

/// Exports for Pages Model
export 'src/utils/onboarding_page_model.dart';

import 'package:flutter/material.dart';
import 'package:smart_onboarding/src/widgets/cascade_onboarding.dart';
import 'package:smart_onboarding/src/widgets/custom_clipper.dart';
import 'src/widgets/basic_onboarding.dart';
import 'src/widgets/fade_onboarding.dart';
import 'src/widgets/parallax_onboarding.dart';
import 'src/utils/onboarding_page_model.dart';

/// Enum for choosing animation type
enum AnimationType { basic, fade, cascade, parallax }

/// Defines available indicator shapes
enum IndicatorStyle {
  circle,
  rectangle,
  roundedRectangle,
  dash,
  diamond,
  triangle,
}

/// Enum for different clip styles
enum ClipType { none, roundedBottom, wavy, diagonal }

/// Returns the correct CustomClipper for a given [ClipType].
CustomClipper<Path>? getClipperForType(ClipType type) {
  switch (type) {
    case ClipType.roundedBottom:
      return RoundedBottomClipper();
    case ClipType.wavy:
      return WavyClipper();
    case ClipType.diagonal:
      return DiagonalClipper();
    case ClipType.none:
      return null;
  }
}

/// Wrapper widget that decides which onboarding animation variant to use
class SmartOnboarding extends StatelessWidget {
  final List<OnboardingPageModel> pages;
  final AnimationType animationType;
  final ClipType clipType;
  final IndicatorStyle indicatorStyle;
  final Color? indicatorActiveColor;
  final Color? indicatorInactiveColor;
  final double? activeIndicatorSize;
  final double? inactiveIndicatorSize;
  final double? indicatorSpacing;
  final VoidCallback onSkip;
  final VoidCallback onFinish;

  const SmartOnboarding({
    super.key,
    required this.pages,
    this.animationType = AnimationType.basic,
    this.clipType = ClipType.none,
    this.indicatorStyle = IndicatorStyle.circle,
    this.indicatorActiveColor,
    this.indicatorInactiveColor,
    this.activeIndicatorSize,
    this.inactiveIndicatorSize,
    this.indicatorSpacing,
    required this.onSkip,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    switch (animationType) {
      case AnimationType.fade:
        return FadeOnboarding(
          pages: pages,
          clipType: clipType,
          indicatorStyle: indicatorStyle,
          indicatorActiveColor:
              indicatorActiveColor ?? Theme.of(context).colorScheme.primary,
          indicatorInactiveColor: indicatorInactiveColor,
          activeIndicatorSize: activeIndicatorSize,
          inactiveIndicatorSize: inactiveIndicatorSize,
          indicatorSpacing: indicatorSpacing,
          onSkip: onSkip,
          onFinish: onFinish,
        );
      case AnimationType.parallax:
        return ParallaxOnboarding(
          pages: pages,
          clipType: clipType,
          indicatorStyle: indicatorStyle,
          indicatorActiveColor:
              indicatorActiveColor ?? Theme.of(context).colorScheme.primary,
          indicatorInactiveColor: indicatorInactiveColor,
          activeIndicatorSize: activeIndicatorSize,
          inactiveIndicatorSize: inactiveIndicatorSize,
          indicatorSpacing: indicatorSpacing,
          onSkip: onSkip,
          onFinish: onFinish,
        );
      case AnimationType.cascade:
        return CascadeOnboarding(
          pages: pages,
          clipType: clipType,
          indicatorStyle: indicatorStyle,
          indicatorActiveColor:
              indicatorActiveColor ?? Theme.of(context).colorScheme.primary,
          indicatorInactiveColor: indicatorInactiveColor,
          activeIndicatorSize: activeIndicatorSize,
          inactiveIndicatorSize: inactiveIndicatorSize,
          indicatorSpacing: indicatorSpacing,
          onSkip: onSkip,
          onFinish: onFinish,
        );
      case AnimationType.basic:
        return BasicOnboarding(
          pages: pages,
          clipType: clipType,
          indicatorStyle: indicatorStyle,
          indicatorActiveColor:
              indicatorActiveColor ?? Theme.of(context).colorScheme.primary,
          indicatorInactiveColor: indicatorInactiveColor,
          activeIndicatorSize: activeIndicatorSize,
          inactiveIndicatorSize: inactiveIndicatorSize,
          indicatorSpacing: indicatorSpacing,
          onSkip: onSkip,
          onFinish: onFinish,
        );
    }
  }
}
