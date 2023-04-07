import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/presentation/components/checklist_tile.dart';

class ChooseTypePage extends StatelessWidget {
  const ChooseTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checklist Pre-Trip Inspection"),
      ),
      body: Column(
        children: <Widget>[
          ChecklistTile(
            icon: const Icon(
              Icons.note_add,
              color: Colors.orangeAccent,
            ),
            title: const Text(
              "Inspeksi Harian",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(
                iFillHeaderRoute,
                arguments: "daily",
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: const Text("Baru"),
            ),
          ),
          ChecklistTile(
            icon: const Icon(
              Icons.note_add,
              color: Colors.orangeAccent,
            ),
            title: const Text(
              "Inspeksi Mingguan",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(
                iFillHeaderRoute,
                arguments: "weekly",
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: const Text("Baru"),
            ),
          ),
          ChecklistTile(
            icon: const Icon(
              Icons.note_add,
              color: Colors.orangeAccent,
            ),
            title: const Text(
              "Inspeksi Bulanan",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(
                iFillHeaderRoute,
                arguments: "monthly",
              ),
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
