import 'package:flutter/material.dart';
import '../../smart_onboarding.dart';
import '../utils/constants.dart';
import '../utils/onboarding_controller.dart';
import '../utils/onboarding_indicators.dart';

class ParallaxOnboarding extends StatefulWidget {
  final List<OnboardingPageModel> pages;
  final ClipType clipType;
  final IndicatorStyle indicatorStyle;
  final Color? indicatorActiveColor;
  final Color? indicatorInactiveColor;
  final double? activeIndicatorSize;
  final double? inactiveIndicatorSize;
  final double? indicatorSpacing;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;
  final OnboardingController? controller;

  const ParallaxOnboarding({
    super.key,
    required this.pages,
    required this.clipType,
    required this.indicatorStyle,
    this.indicatorActiveColor,
    this.indicatorInactiveColor,
    this.activeIndicatorSize,
    this.inactiveIndicatorSize,
    this.indicatorSpacing,
    this.onSkip,
    this.onFinish,
    this.controller,
  });

  @override
  State<ParallaxOnboarding> createState() => _ParallaxOnboardingState();
}

class _ParallaxOnboardingState extends State<ParallaxOnboarding> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Listen to page changes
    _pageController.addListener(() {
      final newIndex = _pageController.page?.round() ?? 0;
      if (_currentIndex != newIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
        widget.controller?.updateIndex(newIndex);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.pages[_currentIndex].resolveBackgroundColor(
        context,
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.pages.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (context, index) {
              final page = widget.pages[index];

              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 0;
                  if (_pageController.hasClients) {
                    value = (_pageController.page ?? 0) - index;
                    value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                  }

                  return Opacity(
                    opacity: value,
                    child: Column(
                      children: [
                        ClipPath(
                          clipper: getClipperForType(widget.clipType),
                          child: Transform.translate(
                            offset: Offset(0, 40 * (1 - value)),
                            child: Container(
                              color: page.resolveImageBackgroundColor(),
                              height: MediaQuery.of(context).size.height * 0.54,
                              width: double.infinity,
                              child: page.resolveCoverImage(page.image),
                            ),
                          ),
                        ),
                        const SizedBox(height: kDefaultSpacing),
                        Padding(
                          padding: kDefaultPadding,
                          child: Column(
                            children: [
                              Text(
                                page.title,
                                textAlign: TextAlign.center,
                                style: page.resolveTitleTextStyle(context),
                              ),
                              const SizedBox(height: 12.0),
                              Text(
                                page.description,
                                textAlign: TextAlign.center,
                                style: page.resolveDescriptionTextStyle(
                                  context,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          // Custom Indicators
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: OnboardingIndicator(
              currentIndex: _currentIndex,
              totalCount: widget.pages.length,
              activeColor: widget.indicatorActiveColor,
              inactiveColor: widget.indicatorInactiveColor ?? Colors.grey,
              activeSize: widget.activeIndicatorSize ?? 12,
              inactiveSize: widget.inactiveIndicatorSize ?? 10,
              spacing: widget.indicatorSpacing ?? 10,
              style: widget.indicatorStyle,
            ),
          ),

          // Bottom Buttons
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentIndex < widget.pages.length - 1)
                  TextButton(
                    onPressed: widget.onSkip,
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                      textStyle: WidgetStateProperty.all(
                        widget.pages[_currentIndex].skipButtonTextStyle ??
                            Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    child: const Text('Skip'),
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentIndex == widget.pages.length - 1) {
                      widget.onFinish?.call();
                    } else {
                      _pageController.nextPage(
                        duration: kDefaultAnimationDuration,
                        curve: kDefaultAnimationCurve,
                      );
                    }
                  },
                  style:
                      widget.pages[_currentIndex].continueButtonStyle ??
                      ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(kButtonRadius),
                        ),
                      ),
                  child: Text(
                    _currentIndex == widget.pages.length - 1
                        ? 'Finish'
                        : 'Continue',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.black87
                              : Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
