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
            ChecklistTile(
              icon: const Icon(
                Icons.note_add,
                color: Colors.orangeAccent,
              ),
              title: _checklistTileTitle(
                title: "Buat Inspeksi Baru",
              ),
              trailing: _checklistTileTrailing(
                context: context,
                route: iChooseTypeRoute,
              ),
            ),
            ChecklistTile(
              icon: const Icon(
                Icons.library_books,
                color: Colors.orangeAccent,
              ),
              title: _checklistTileTitle(
                title: "Inspeksi Saya",
              ),
              trailing: _checklistTileTrailing(
                context: context,
                route: iMyInspectionRoute,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Text _checklistTileTitle({required String title}) {
  return Text(
    title,
    style: const TextStyle(
      color: Colors.black54,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget _checklistTileTrailing({
  required BuildContext context,
  required String route,
}) {
  return ElevatedButton(
    onPressed: () {
      Navigator.of(context).pushNamed(route);
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orangeAccent,
    ),
    child: const Text("Baru"),
  );
}
