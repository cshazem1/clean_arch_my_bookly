import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';
  static const kBookDetailsView = '/BookDetailsView';
  static const kSearch = '/Search';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearch,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomeView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.slowMiddle).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const BookDetailsView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeOutBack).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
