
# Smart Onboarding
A complete flutter package for a seamless onboarding process. You can choose the animation type for screens switching, clip type for images to clip them in a custom shape, indicators style, your own continue and skip button styles, full customization with dark mode support.

## Features

✅ Multiple Onboarding Styles  
✅ Dark/Light Theme Adaptive  
✅ Configurable Skip & Continue Buttons  
✅ Indicator Customization  
✅ Theme & Color Handling  
✅ Page Transition Control  
✅ Supports Images, Text, and Custom Layouts  
✅ Easily Integrate into any Flutter project

### Animation Type
|                                                    Basic                                                    |                                                   Fade                                                    |                                                     Parallax                                                      |                                                     Cascade                                                     |
|:-----------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------:|
| ![Basic](https://raw.githubusercontent.com/ShifaSaleem/smart_onboarding/master/images/onboarding_basic.gif) | ![Fade](https://raw.githubusercontent.com/ShifaSaleem/smart_onboarding/master/images/onboarding_fade.gif) | ![Parallax](https://raw.githubusercontent.com/ShifaSaleem/smart_onboarding/master/images/onboarding_parallax.gif) | ![Cascade](https://raw.githubusercontent.com/ShifaSaleem/smart_onboarding/master/images/onboarding_cascade.gif) |

### Image Clip Styles

Customize how onboarding images are clipped with beautiful curves and shapes.

|                                                        Rounded                                                         |                                                        Diagonal                                                        |                                                      Wavy                                                      |
|:----------------------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------:|
| ![Rounded](https://raw.githubusercontent.com/ShifaSaleem/smart_onboarding/master/images/onboarding_indicator_dash.png) | ![Diagonal](https://raw.githubusercontent.com/ShifaSaleem/smart_onboarding/master/images/onboarding_clip_diagonal.png) | ![Wavy](https://raw.githubusercontent.com/ShifaSaleem/smart_onboarding/master/images/onboarding_clip_wavy.png) |

### Custom Indicator Styles

|                                                      Circle                                                      |                                                               Rounded Rectangle                                                               |                                                        Dash                                                         |
|:----------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------------------------------:|
| ![Circle](https://raw.githubusercontent.com/ShifaSaleem/smart_onboarding/master/images/onboarding_clip_wavy.png) | ![Rounded Rectangle](https://raw.githubusercontent.com/ShifaSaleem/smart_onboarding/master/images/onboarding_indicator_rounded_rectangle.png) | ![Dash](https://raw.githubusercontent.com/ShifaSaleem/smart_onboarding/master/images/onboarding_indicator_dash.png) | 

|                                                          Diamond                                                          |                                                          Triangle                                                           | 
|:-------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------:|
| ![Diamond](https://raw.githubusercontent.com/ShifaSaleem/smart_onboarding/master/images/onboarding_indicator_diamond.png) | ![Triangle](https://raw.githubusercontent.com/ShifaSaleem/smart_onboarding/master/images/onboarding_indicator_triangle.png) |

---

## Getting started

### 1. Add dependency

```yaml
dependencies:
  smart_onboarding: ^1.0.0
```

## Usage

```dart
SmartOnboarding(
      pages: [
        OnboardingPageModel(
          title: 'Welcome',
          description: 'Your new experience starts here.',
          image: Image.network(
            'https://www.cflowapps.com/wp-content/uploads/2018/07/employee-onboarding-process-flow.png',
          ),
        ),
        OnboardingPageModel(
          title: 'Stay Connected',
          description: 'Never miss important updates and news.',
          image: Image.asset('assets/images/onboarding2.jpg'),
        ),
        OnboardingPageModel(
          title: 'Achieve More',
          description: 'Unlock your full potential with our tools.',
          image: Image.asset('assets/images/onboarding3.png'),
        ),
      ],
      onSkip: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      ),
      onFinish: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      ),
    );

```
