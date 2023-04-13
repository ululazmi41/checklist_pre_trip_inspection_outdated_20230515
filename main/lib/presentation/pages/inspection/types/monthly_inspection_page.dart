import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/presentation/components/check_tile.dart';
import 'package:main/presentation/provider/database_provider.dart';
import 'package:provider/provider.dart';

class InspectionMonth extends StatefulWidget {
  const InspectionMonth({super.key});

  @override
  State<InspectionMonth> createState() => InspectionMonthState();
}

class InspectionMonthState extends State<InspectionMonth> {
  /* UJI FUNGSI (oleh pengemudi / bersama mekanik, uji dengan laju < 20kpj di lokasi aman) */
  int kinerjaRem = 0;
  int kinerjaMesin = 0;
  int transmisi4WD = 0;

  /* CEK VISUAL */
  int sekering = 0;
  int bagianBawahKendaraan = 0;

  File? photofile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inspeksi Mingguan"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          top: 12.0,
          right: 24.0,
          bottom: 36.0,
        ),
        child: SingleChildScrollView(
          child: content(),
        ),
      ),
    );
  }

  Widget content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Text("Tanggal: "),
            Text(
              "29 Maret 2023",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        _title(
            "UJI FUNGSI (oleh pengemudi / bersama mekanik, uji dengan laju < 20kpj di lokasi aman)"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _ujiFungsi(),
        ),
        _title("CEK VISUAL"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _cekVisual(),
        ),
        Row(
          // TODO: use proper widget
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _submitButton(),
          ],
        ),
      ],
    );
  }

  Widget _title(String title) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
            bottom: 4.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: const <Widget>[
                  Text(
                    "Kondisi",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    "Foto",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 2.0,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _ujiFungsi() {
    return Column(
      children: [
        CheckTile(
          title: "KINERJA REM",
          state: kinerjaRem,
          onChange: (int state) {
            setState(() {
              kinerjaRem = state;
            });
          },
        ),
        CheckTile(
          title: "Kinerja Mesin",
          state: kinerjaMesin,
          onChange: (int state) {
            setState(() {
              kinerjaMesin = state;
            });
          },
        ),
        CheckTile(
          title: "Transmisi 4WD (jika dilengkapi)",
          state: transmisi4WD,
          onChange: (int state) {
            setState(() {
              transmisi4WD = state;
            });
          },
        ),
      ],
    );
  }

  Widget _cekVisual() {
    return Column(
      children: <Widget>[
        CheckTile(
          title: "Sekering (fuse)",
          state: sekering,
          onChange: (int state) {
            setState(() {
              sekering = state;
            });
          },
        ),
        CheckTile(
          title: "Bagian bawah kendaraan, suspensi, poros, propeller, axie",
          state: bagianBawahKendaraan,
          onChange: (int state) {
            setState(() {
              bagianBawahKendaraan = state;
            });
          },
        ),
      ],
    );
  }

  Consumer _submitButton() {
    return Consumer<DatabaseProvider>(
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: () {
            if (value.inspectionId == null) {
              throw "no inspectionId is given";
            }

            context.read<DatabaseProvider>().insertInspectionMonth(
                  inspectionId: value.inspectionId!,
                  kinerjaRem: kinerjaRem,
                  kinerjaMesin: kinerjaMesin,
                  transmisi4WD: transmisi4WD,
                  sekering: sekering,
                  bagianBawahKendaraan: bagianBawahKendaraan,
                );

            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(iMyInspectionRoute);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
          ),
          child: const Text("Simpan"),
        );
      },
    );
  }
}
