// onboarding_page_model.dart

import 'package:flutter/material.dart';

/// A model representing a single onboarding screen/page.
class OnboardingPageModel {
  /// Title of the onboarding page.
  final String title;

  /// Description or subtitle text.
  final String description;

  /// The image widget displayed (can be AssetImage, NetworkImage, etc.).
  final Widget image;

  /// Background color of the whole screen.
  final Color? backgroundColor;

  /// Optional color behind the image section.
  final Color? imageBackgroundColor;

  /// Optional custom text style for the title.
  final TextStyle? titleTextStyle;

  /// Optional custom text style for the description.
  final TextStyle? descriptionTextStyle;

  /// Optional text style for the skip button.
  final TextStyle? skipButtonTextStyle;

  /// Optional button style for the continue/finish button.
  final ButtonStyle? continueButtonStyle;

  /// Creates a model for one onboarding screen.
  const OnboardingPageModel({
    required this.title,
    required this.description,
    required this.image,
    this.backgroundColor,
    this.imageBackgroundColor,
    this.titleTextStyle,
    this.descriptionTextStyle,
    this.skipButtonTextStyle,
    this.continueButtonStyle,
  });

  // Theme-aware helpers
  Color resolveBackgroundColor(BuildContext context) =>
      backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;

  Color resolveImageBackgroundColor() =>
      imageBackgroundColor ?? Colors.transparent;

  TextStyle resolveTitleTextStyle(BuildContext context) =>
      titleTextStyle ??
      Theme.of(context).textTheme.headlineMedium!.copyWith(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
        fontWeight: FontWeight.bold,
      );

  TextStyle resolveDescriptionTextStyle(BuildContext context) =>
      descriptionTextStyle ??
      Theme.of(context).textTheme.bodyLarge!.copyWith(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.white70
                : Colors.black87,
      );

  Widget resolveCoverImage(Widget image) {
    if (image is Image) {
      return Image(
        image: image.image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    } else {
      return image;
    }
  }
}
