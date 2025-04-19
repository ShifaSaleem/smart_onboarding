
# Smart Onboarding
A complete flutter package for a seamless onboarding process. You can choose animation type for screens switching,clip type for images to clip them in a custom shape, indicators style, your own continue and skip button styles, full customization with dark mode support.

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
| Basic | Fade | Parallax | Cascade |
|:-----:|:----:|:--------:|:-------:|
| ![](https://github.com/ShifaSaleem/smart_onboarding/blob/master/images/Onboarding%20basic.gif) | ![](https://github.com/ShifaSaleem/smart_onboarding/blob/master/images/onboarding%20fade.gif) | ![](https://github.com/ShifaSaleem/smart_onboarding/blob/master/images/onboarding%20parallax.gif) | ![](https://github.com/ShifaSaleem/smart_onboarding/blob/master/images/onboarding%20cascade.gif) |

### Image Clip Styles

Customize how onboarding images are clipped with beautiful curves and shapes.

| Rounded | Diagonal | Wavy |
|:-------:|:--------:|:----:|
| ![](https://github.com/ShifaSaleem/smart_onboarding/blob/master/images/Onboarding%20indicator%20dash.png) | ![](https://github.com/ShifaSaleem/smart_onboarding/blob/master/images/Onboarding%20clipe%20diagonal.png) | ![](https://github.com/ShifaSaleem/smart_onboarding/blob/master/images/Onboarding%20clip%20wavy.png) |

### Custom Indicator Styles

| Circle | Rounded Rectangle | Dash |
|:------:|:---------:|:----:|
| ![](https://github.com/ShifaSaleem/smart_onboarding/blob/master/images/Onboarding%20clip%20wavy.png) | ![](https://github.com/ShifaSaleem/smart_onboarding/blob/master/images/Onboarding%20indicator%20rounded%20rectange.png) | ![](https://github.com/ShifaSaleem/smart_onboarding/blob/master/images/Onboarding%20indicator%20dash.png) | 

| Diamond | Triangle | 
|:------:|:---------:|
| ![](https://github.com/ShifaSaleem/smart_onboarding/blob/master/images/Onboarding%20indicator%20diamond.png) | ![](https://github.com/ShifaSaleem/smart_onboarding/blob/master/images/Onboarding%20indicator%20triangle.png) |

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
