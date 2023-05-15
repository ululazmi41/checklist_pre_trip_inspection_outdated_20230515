import 'package:flutter/material.dart';
import 'package:main/presentation/pages/inspection/my_inspection_page.dart';

class WeeklyMyInspectionsPage extends StatelessWidget {
  const WeeklyMyInspectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inspeksi Mingguan"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 05, 07).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.week,
                hideTimeType: true,
                plat: "LA-01",
                company: "Shopee",
                carType: "Hilux",
                week: "I",
                location: "Jogjakarta",
              ),
              const SizedBox(height: 12.0),
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 05, 14).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.week,
                hideTimeType: true,
                plat: "LA-21",
                company: "Telkomsel",
                carType: "Hilux",
                week: "II",
                location: "Padang",
              ),
              const SizedBox(height: 12.0),
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 05, 21).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.week,
                hideTimeType: true,
                plat: "LA-04",
                company: "XL Axiata",
                carType: "Hilux",
                week: "III",
                location: "Dumai",
              ),
              const SizedBox(height: 12.0),
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 05, 28).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.week,
                hideTimeType: true,
                plat: "LA-23",
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
