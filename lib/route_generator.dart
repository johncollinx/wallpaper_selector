import 'dart:math';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/browse_page.dart';
import 'pages/favourites_page.dart';
import 'pages/settings_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    Widget page;

    switch (settings.name) {
      case '/':
        page = const HomePage();
        break;
      case '/browse':
        page = const BrowseCategoryPage();
        break;
      case '/favourites':
        page = const FavouritesPage();
        break;
      case '/settings':
        page = const SettingsPage();
        break;
      default:
        page = const Scaffold(
          body: Center(child: Text('404 - Page Not Found')),
        );
    }

    return _randomTransition(page, settings);
  }

  static Route _randomTransition(Widget page, RouteSettings settings) {
    final random = Random().nextInt(3);
    switch (random) {
      case 0:
        return _fadeRoute(page, settings);
      case 1:
        return _slideRoute(page, settings);
      case 2:
      default:
        return _scaleRoute(page, settings);
    }
  }

  static PageRouteBuilder _fadeRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  static PageRouteBuilder _slideRoute(Widget page, RouteSettings settings) {
    final random = Random().nextInt(4);
    final beginOffsets = [
      const Offset(1, 0), // from right
      const Offset(-1, 0), // from left
      const Offset(0, 1), // from bottom
      const Offset(0, -1), // from top
    ];
    final begin = beginOffsets[random];

    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final offsetAnimation =
            Tween(begin: begin, end: Offset.zero).animate(animation);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static PageRouteBuilder _scaleRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return ScaleTransition(scale: animation, child: child);
      },
    );
  }
}
