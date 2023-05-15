import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/presentation/components/checklist_tile.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Checklist Pre-Trip Inspection"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: ChecklistTile(
                icon: const Icon(
                  Icons.note_add,
                  color: Colors.orangeAccent,
                ),
                title: "Buat Inspeksi Baru",
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(iChooseTypeRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: const Text("Baru"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: ChecklistTile(
                icon: const Icon(
                  Icons.library_books,
                  color: Colors.orangeAccent,
                ),
                title: "Inspeksi Saya",
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(iMyInspectionRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: const Text("Lihat"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
