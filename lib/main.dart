import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:checklist_pre_trip_inspection/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFE5E8F0),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: homeRoute,
      onGenerateRoute: routes,
    );
  }
}
