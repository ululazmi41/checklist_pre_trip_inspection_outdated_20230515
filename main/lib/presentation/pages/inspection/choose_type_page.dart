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
              title: "Inspeksi Harian",
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
          ),
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
              title: "Inspeksi Mingguan",
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
          ),
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
              title: "Inspeksi Bulanan",
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
          ),
        ],
      ),
    );
  }
}
