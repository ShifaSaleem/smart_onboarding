import 'package:flutter/material.dart';
import 'package:smart_onboarding/smart_onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Onboarding Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartOnboarding(
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
      animationType: AnimationType.fade,
      clipType: ClipType.roundedBottom,
      indicatorStyle: IndicatorStyle.circle,
      indicatorActiveColor: Theme.of(context).colorScheme.primary,
      indicatorInactiveColor: Colors.grey.shade400,
      activeIndicatorSize: 12,
      inactiveIndicatorSize: 10,
      indicatorSpacing: 10,
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
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome to Home!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
