import 'dart:ffi';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/presentation/components/checklist_tile.dart';
import 'package:main/presentation/provider/database_provider.dart';
import 'package:provider/provider.dart';

enum MyInspectionCardType {
  day,
  week,
  month,
}

class MyInspectionPage extends StatelessWidget {
  const MyInspectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inspeksi Saya"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 12.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Berdasarkan Jenis Laporan",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: ChecklistTile(
                  icon: const Icon(
                    Icons.library_books,
                    color: Colors.orangeAccent,
                  ),
                  title: "Inspeksi Harian",
                  trailing: ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                      iMyInspectionDailyRoute,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                    ),
                    child: const Text("Lihat"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: ChecklistTile(
                  icon: const Icon(
                    Icons.library_books,
                    color: Colors.orangeAccent,
                  ),
                  title: "Inspeksi Mingguan",
                  trailing: ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                      iMyInspectionWeeklyRoute,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                    ),
                    child: const Text("Lihat"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: ChecklistTile(
                  icon: const Icon(
                    Icons.library_books,
                    color: Colors.orangeAccent,
                  ),
                  title: "Inspeksi Bulanan",
                  trailing: ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                      iMyInspectionMonthlyRoute,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                    ),
                    child: const Text("Lihat"),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Terbaru",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 05, 29).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.month,
                plat: "LA-28",
                company: "Lintasarta",
                carType: "Hilux",
                week: "IV",
                location: "Duri",
              ),
              const SizedBox(height: 12.0),
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime(2023, 05, 27).millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.day,
                plat: "LA-22",
                company: "Tokopedia",
                carType: "Hilux",
                week: "IV",
                location: "Jakarta",
              ),
              const SizedBox(height: 12.0),
              MyInspectionCard(
                author: "Ulul Azmi",
                dateTimestamp: DateTime.now().millisecondsSinceEpoch,
                inspectionType: MyInspectionCardType.week,
                plat: "LA-31",
                company: "Pertamina",
                carType: "Hilux",
                week: "III",
                location: "Dumai",
              ),
              // _consumerDebug(context),
            ],
          ),
        ),
      ),
    );
  }
}

class MyInspectionCard extends StatelessWidget {
  const MyInspectionCard({
    this.hideTimeType = false,
    Key? key,
    required this.author,
    required this.inspectionType,
    // required this.hideTimeType,
    required this.dateTimestamp,
    required this.company,
    required this.plat,
    required this.carType,
    required this.week,
    required this.location,
  }) : super(key: key);

  final String author;
  final MyInspectionCardType inspectionType;
  final bool hideTimeType;
  final int dateTimestamp;
  final String plat;
  final String company;
  final String carType;
  final String week;
  final String location;

  String translateTypeLabel(MyInspectionCardType type) {
    if (type == MyInspectionCardType.day) {
      return "hari";
    } else if (type == MyInspectionCardType.week) {
      return "minggu";
    } else if (type == MyInspectionCardType.month) {
      return "bulan";
    } else {
      return "ERROR: UNKNOWN TYPE";
    }
  }

  Color translateTypeColor(MyInspectionCardType type) {
    if (type == MyInspectionCardType.day) {
      return Colors.redAccent;
    } else if (type == MyInspectionCardType.week) {
      return Colors.orangeAccent;
    } else if (type == MyInspectionCardType.month) {
      return Colors.green;
    } else {
      return Colors.black;
    }
  }

  String renderDateTime(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  //! mixins

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  author,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                hideTimeType
                    ? const SizedBox()
                    : Text(
                        translateTypeLabel(inspectionType),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: translateTypeColor(inspectionType)),
                      ),
                Text(
                  renderDateTime(dateTimestamp),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ), // todo: in timestamp,
              ],
            ),
          ),
          Container(
            height: 2.0,
            color: translateTypeColor(inspectionType),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _MyInspectionCardody(
                  plat: plat,
                  company: company,
                  carType: carType,
                  week: week,
                  location: location,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text("Excel"),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text("PDF"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyInspectionCardody extends StatelessWidget {
  const _MyInspectionCardody({
    Key? key,
    required this.plat,
    required this.company,
    required this.carType,
    required this.week,
    required this.location,
  }) : super(key: key);

  final double gap = 4.0;
  final String plat;
  final String company;
  final String carType;
  final String week;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  const Text(
                    "Plat Nomor:",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: gap),
                  const Text(
                    "PT:",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: gap),
                  const Text(
                    "Type:",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    " $plat",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: gap),
                  Text(
                    " $company",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: gap),
                  Text(
                    " $carType",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  const Text(
                    "Minggu:",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: gap),
                  const Text(
                    "Location:",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    " $week",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: gap),
                  Text(
                    " $location",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Consumer _consumerDebug(BuildContext context) {
  return Consumer<DatabaseProvider>(
    builder: (context, value, child) {
      if (value.databaseState == DatabaseState.loading) {
        return const Center(
          child: Text("Loading"),
        );
      } else if (value.databaseState == DatabaseState.hasData) {
        return Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.read<DatabaseProvider>().resetDatabase();
              },
              child: const Text("Reset Database"),
            ),
            const Text("Inspections: "),
            ListView.builder(
              shrinkWrap: true,
              itemCount: value.inspections.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: <Widget>[
                    Text("Inspection: ${value.inspections[index].id}"),
                    Text("Day: ${value.inspections[index].inspeksiHarian}"),
                    Text("Date: ${value.inspections[index].inspeksiMingguan}"),
                    Text("Month: ${value.inspections[index].inspeksiBulanan}"),
                  ],
                );
              }),
            ),
            const Text("Day Inspections: "),
            ListView.builder(
              shrinkWrap: true,
              itemCount: value.dayInspections.length,
              itemBuilder: ((context, index) {
                return Text("${value.dayInspections[index]}");
              }),
            ),
            const Text("Week Inspections: "),
            ListView.builder(
              shrinkWrap: true,
              itemCount: value.weekInspections.length,
              itemBuilder: ((context, index) {
                return Text("${value.weekInspections[index]}");
              }),
            ),
            const Text("Month Inspections: "),
            ListView.builder(
              shrinkWrap: true,
              itemCount: value.monthInspections.length,
              itemBuilder: ((context, index) {
                return Text("${value.monthInspections[index]}");
              }),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<DatabaseProvider>().fetchInspections();
                },
                child: const Text("Refresh Provider")),
          ],
        );
      } else if (value.databaseState == DatabaseState.noData) {
        return const Center(
          child: Text("No Data"),
        );
      } else if (value.databaseState == DatabaseState.error) {
        return const Center(
          child: Text("Unexpected error!"),
        );
      } else {
        return Text("Unknown state: ${value.databaseState}");
      }
    },
  );
}
