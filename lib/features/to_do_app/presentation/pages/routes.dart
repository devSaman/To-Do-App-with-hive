import 'package:flutter/material.dart';
import 'package:to_do_app/features/to_do_app/presentation/pages/detail_page.dart';
import 'package:to_do_app/features/to_do_app/presentation/pages/home_page.dart';

import '../../domain/models/to_do_model.dart';

class RouteManager {
  static generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/detail_page':
        return MaterialPageRoute(
          builder: (_) => DetailPage(task: args as ToDo),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
