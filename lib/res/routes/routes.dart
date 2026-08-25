import 'package:hair_rep_by_yoyo/res/routes/screen_export.dart';

/// This class manages app-wide route generation for navigation.
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.signIn:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case RoutesName.verify:
        return MaterialPageRoute(builder: (context) => const VerifyScreen());
      case RoutesName.bottomNavigationBarScreen:
        return MaterialPageRoute(
          builder: (context) => const BottomNavigationBarScreen(),
        );
      case RoutesName.searchLocation:
        return MaterialPageRoute(
          builder: (context) => const SearchLocationScreen(),
        );
      case RoutesName.salonDetails:
        return MaterialPageRoute(
          builder: (context) => const SalonDetailsScreen(),
        );
      case RoutesName.stylistSelect:
        return MaterialPageRoute(
          builder: (context) => const StylistSelectScreen(),
        );
      case RoutesName.dateTimeSelect:
        return MaterialPageRoute(
          builder: (context) => const DateTimeSelectScreen(),
        );
      case RoutesName.checkoutScreen:
        return MaterialPageRoute(
          builder: (context) => const CheckoutScreen(),
        );
      case RoutesName.paymentScreen:
        return MaterialPageRoute(
          builder: (context) => const PaymentScreen(),
        );
      case RoutesName.receiptScreen:
        return MaterialPageRoute(
          builder: (context) => const ReceiptScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => RouteErrorScreen(routeName: settings.name),
        );
    }
  }
}
