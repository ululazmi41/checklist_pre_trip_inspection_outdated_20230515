import 'package:flutter/material.dart';
import 'package:main/presentation/pages/home_page.dart';

const placeholder = '';
const initialRoute = 'home';

MaterialPageRoute routes(RouteSettings settings) {
  switch (settings.name) {
    case initialRoute:
      return MaterialPageRoute(
        builder: (_) => const MyHomePage(),
      );
    case placeholder:
      return MaterialPageRoute(
        builder: (_) => const Placeholder(),
      );
  }
  // TODO: ignore? else make a default 404 page
  return MaterialPageRoute(
    builder: (_) => const Placeholder(),
  );
}
