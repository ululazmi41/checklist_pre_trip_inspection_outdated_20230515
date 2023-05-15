import 'package:flutter/material.dart';
import 'package:main/presentation/pages/inspection/my_inspection_page.dart';

class MonthlyMyInspectionsPage extends StatelessWidget {
  const MonthlyMyInspectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inspeksi Bulanan"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 01, 31).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.month,
                hideTimeType: true,
                plat: "LA-21",
                company: "Lintasarta",
                carType: "Hilux",
                week: "IV",
                location: "Duri",
              ),
              const SizedBox(height: 12.0),
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 02, 28).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.month,
                hideTimeType: true,
                plat: "LA-19",
                company: "Lintasarta",
                carType: "Hilux",
                week: "IV",
                location: "Duri",
              ),
              const SizedBox(height: 12.0),
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 03, 31).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.month,
                hideTimeType: true,
                plat: "LA-28",
                company: "Lintasarta",
                carType: "Hilux",
                week: "IV",
                location: "Duri",
              ),
              const SizedBox(height: 12.0),
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 04, 30).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.month,
                hideTimeType: true,
                plat: "LA-04",
                company: "Lintasarta",
                carType: "Hilux",
                week: "IV",
                location: "Duri",
              ),
              const SizedBox(height: 12.0),
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 05, 31).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.month,
                hideTimeType: true,
                plat: "LA-01",
                company: "Lintasarta",
                carType: "Hilux",
                week: "IV",
                location: "Duri",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
