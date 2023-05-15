import 'package:flutter/material.dart';
import 'package:main/presentation/pages/inspection/my_inspection_page.dart';

class DailyMyInspectionsPage extends StatelessWidget {
  const DailyMyInspectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inspeksi Harian"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 05, 12).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.day,
                hideTimeType: true,
                plat: "LA-11",
                company: "Pertamina",
                carType: "Hilux",
                week: "II",
                location: "Pekanbaru",
              ),
              const SizedBox(height: 12.0),
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 05, 11).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.day,
                hideTimeType: true,
                plat: "LA-12",
                company: "Lenovo",
                carType: "Hilux",
                week: "II",
                location: "Medan",
              ),
              const SizedBox(height: 12.0),
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 05, 10).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.day,
                hideTimeType: true,
                plat: "LA-24",
                company: "Lintasarta",
                carType: "Hilux",
                week: "II",
                location: "Makassar",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
