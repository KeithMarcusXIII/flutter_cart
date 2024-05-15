import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'presentation/cart/cart_page.dart';
import 'presentation/catalogue/catalogue_page.dart';

GoRouter router() {
  final routes = [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return CataloguePage();
      },
    ),
    GoRoute(
      path: '/explore',
      builder: (context, state) {
        return Container();
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) {
        return CartPage();
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) {
        return Container();
      },
    ),
  ];

  return GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        routes: routes,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                final tappedRoute = routes[index];
                GoRouter.of(context).go(tappedRoute.path);
              },
              items: routes.map((e) {
                var icon = Icons.question_mark;
                var label = 'Unknown';

                switch (e.path) {
                  case '/home':
                    icon = Icons.home;
                    label = 'Home';
                    break;
                  case '/explore':
                    icon = Icons.explore;
                    label = 'Explore';
                    break;
                  case '/cart':
                    icon = Icons.shopping_basket;
                    label = 'Cart';
                    break;
                  case '/profile':
                    icon = Icons.person;
                    label = 'Profile';
                    break;
                  default:
                    break;
                }

                return BottomNavigationBarItem(
                  icon: Icon(icon),
                  label: label,
                );
              }).toList(),
            ),
          );
        },
      ),
    ],
  );
}
