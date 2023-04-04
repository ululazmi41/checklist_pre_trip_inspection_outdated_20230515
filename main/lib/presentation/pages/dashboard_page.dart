import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/presentation/components/checklist_tile.dart';

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
