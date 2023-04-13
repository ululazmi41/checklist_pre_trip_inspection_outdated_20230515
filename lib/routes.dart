import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/presentation/pages/dashboard_page.dart';
import 'package:main/presentation/pages/inspection/choose_type_page.dart';
import 'package:main/presentation/pages/inspection/fill_header_page.dart';
import 'package:main/presentation/pages/inspection/types/daily_inspection_page.dart';
import 'package:main/presentation/pages/inspection/types/monthly_inspection_page.dart';
import 'package:main/presentation/pages/inspection/types/weekly_inspection_page.dart';
import 'package:main/presentation/pages/splash_screen.dart';

const placeholder = '';

MaterialPageRoute routes(RouteSettings settings) {
  switch (settings.name) {
    case splashScreenRoute:
      return MaterialPageRoute(
        builder: (_) => const SplashScreenPage(),
      );
    case dashboardRoute:
      return MaterialPageRoute(
        builder: (_) => const DashboardPage(),
      );

    // Inspection
    case iChooseTypeRoute:
      return MaterialPageRoute(
        builder: (_) => const ChooseTypePage(),
      );
    case iFillHeaderRoute:
      return MaterialPageRoute(
        builder: (_) => FillHeaderPage(
          type: settings.arguments as String,
        ),
      );

    // Inspection Types
    case itDailyInspectionRoute:
      return MaterialPageRoute(
        builder: (_) => const InspectionDay(),
      );
    case itWeeklyInspectionRoute:
      return MaterialPageRoute(
        builder: (_) => const InspectionWeek(),
      );
    case itMonthlyInspectionRoute:
      return MaterialPageRoute(
        builder: (_) => const InspectionMonth(),
      );

    case placeholder:
      return MaterialPageRoute(
        builder: (_) => const Placeholder(),
      );
  }

  // TODO: ignore? else make a default 404 page
  return MaterialPageRoute(
    builder: (_) => const Scaffold(
      body: Center(
        child: Text("Page Not Ready"),
      ),
    ),
  );
}
