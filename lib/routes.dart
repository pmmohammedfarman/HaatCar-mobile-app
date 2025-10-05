import 'package:go_router/go_router.dart';

import 'presentation/onboarding_screens/onboarding_features_screen.dart';
import 'presentation/onboarding_screens/onboarding_welcome_screen.dart';
import 'presentation/onboarding_screens/ready_to_go_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => OnboardingWelcomeScreen()),
    GoRoute(
      path: '/onboarding_welcome_screen', // :id is the parameter
      builder: (context, state) {
        return OnboardingWelcomeScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/onboarding_features_screen', // :id is the parameter
      builder: (context, state) {
        return OnboardingFeaturesScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/onboarding_ready_to_go_screen/:url', // :id is the parameter
      builder: (context, state) {
        return OnboardingReadyToGoScreen(); // Pass the parameter to your page
      },
    ),
  ],
);
