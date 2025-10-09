import 'package:go_router/go_router.dart';
import 'presentation/auth/login_screen.dart';
import 'presentation/auth/otp_screen.dart';
import 'presentation/auth/register_user_screen.dart';
import 'presentation/car_search/car_details_screen.dart';
import 'presentation/car_search/car_search_by_map_screen.dart';
import 'presentation/car_search/car_search_results.dart';
import 'presentation/car_search/choose_car_ally_screen.dart';
import 'presentation/home/home_page.dart';
import 'presentation/onboarding_screens/onboarding_features_screen.dart';
import 'presentation/onboarding_screens/onboarding_welcome_screen.dart';
import 'presentation/onboarding_screens/ready_to_go_screen.dart';
import 'presentation/profile/user_info/user_info_screen.dart';
import 'presentation/profile/wallet/add_cash_screen.dart';
import 'presentation/profile/wallet/add_new_payment_method_screen.dart';
import 'presentation/profile/wallet/edit_new_payment_method_screen.dart';
import 'presentation/profile/wallet/payment_methods_list_screen.dart';
import 'presentation/profile/wallet/wallet_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => OnboardingWelcomeScreen()),

    GoRoute(
      path: '/main_navigation',
      builder: (context, state) => MainNavigation(),
    ),
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
      path: '/onboarding_ready_to_go_screen', // :id is the parameter
      builder: (context, state) {
        return OnboardingReadyToGoScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/register_user_screen', // :id is the parameter
      builder: (context, state) {
        return RegisterUserScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/login_screen', // :id is the parameter
      builder: (context, state) {
        return LoginScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/otp_screen', // :id is the parameter
      builder: (context, state) {
        return OtpScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/my_home_screen', // :id is the parameter
      builder: (context, state) {
        return HomeScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/car_search_results', // :id is the parameter
      builder: (context, state) {
        return CarSearchResults(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/car_search_via_map_screen', // :id is the parameter
      builder: (context, state) {
        return CarSearchByMapScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/choose_car_ally_type_screen', // :id is the parameter
      builder: (context, state) {
        return ChooseCarAllyScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/car_item_details_screen', // :id is the parameter
      builder: (context, state) {
        return CarItemDetailsScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/user_info_screen', // :id is the parameter
      builder: (context, state) {
        return UserInfoScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/wallet_Screen', // :id is the parameter
      builder: (context, state) {
        return WalletScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/payment_methods_screen', // :id is the parameter
      builder: (context, state) {
        return PaymentMethodsScreen(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/edit_payment_methods_screen', // :id is the parameter
      builder: (context, state) {
        return EditPaymentMethodPage(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/add_payment_methods_screen', // :id is the parameter
      builder: (context, state) {
        return AddPaymentMethodPage(); // Pass the parameter to your page
      },
    ),
    GoRoute(
      path: '/add_cash_screen', // :id is the parameter
      builder: (context, state) {
        return AddCashPage(); // Pass the parameter to your page
      },
    ),
  ],
);

// 
