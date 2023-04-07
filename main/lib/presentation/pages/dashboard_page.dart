import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/presentation/components/checklist_tile.dart';
import 'package:main/presentation/provider/database_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pre-Trip Inspection"),
      ),
      body: Column(
        children: <Widget>[
          Consumer<DatabaseProvider>(
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
                            Text(
                                "Day: ${value.inspections[index].inspeksiHarian}"),
                            Text(
                                "Week: ${value.inspections[index].inspeksiMingguan}"),
                            Text(
                                "Month: ${value.inspections[index].inspeksiBulanan}"),
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
          ),
          ChecklistTile(
            icon: const Icon(
              Icons.note_add,
              color: Colors.orangeAccent,
            ),
            title: const Text(
              "Buat Inspeksi Baru",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(iChooseTypeRoute),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: const Text("Baru"),
            ),
          ),
          ChecklistTile(
            icon: const Icon(
              Icons.library_books,
              color: Colors.orangeAccent,
            ),
            title: const Text(
              "Inspeksi Saya",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(iMyInspectionRoute),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: const Text("Baru"),
            ),
          ),
        ],
      ),
    );
  }
}
