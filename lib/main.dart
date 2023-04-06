import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:checklist_pre_trip_inspection/routes.dart';
import 'package:main/data/datasources/db/database_helper.dart';
import 'package:main/data/datasources/local_data_source.dart';
import 'package:main/presentation/provider/database_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DatabaseProvider(
            localDataSourceImpl: LocalDataSourceImpl(
              databaseHelper: DatabaseHelper(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        // title: 'Flutter Demo', // TODO: Remove this line of code
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: const Color(0xFFE5E8F0),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: homeRoute,
        onGenerateRoute: routes,
      ),
    );
  }
}
