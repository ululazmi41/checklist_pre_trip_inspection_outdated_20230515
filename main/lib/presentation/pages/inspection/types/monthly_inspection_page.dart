import 'dart:io';

import 'package:flutter/material.dart';
import 'package:main/presentation/components/check_tile.dart';

class InspectionMonth extends StatefulWidget {
  const InspectionMonth({super.key});

  @override
  State<InspectionMonth> createState() => InspectionMonthState();
}

class InspectionMonthState extends State<InspectionMonth> {
  /* UJI FUNGSI (oleh pengemudi / bersama mekanik, uji dengan laju < 20kpj di lokasi aman) */
  int ufKinerjaRem = 0;
  int ufKinerjaMesin = 0;
  int ufTransmisi = 0;

  /* CEK VISUAL */
  int cvSekering = 0;
  int cvBagianBawah = 0;

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
        child: SingleChildScrollView(child: content()),
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
          child: Column(
            children: [
              CheckTile(
                title: "KINERJA REM",
                state: ufKinerjaRem,
                onChange: (int state) {
                  setState(() {
                    ufKinerjaRem = state;
                  });
                },
              ),
              CheckTile(
                title: "Kinerja Mesin",
                state: ufKinerjaMesin,
                onChange: (int state) {
                  setState(() {
                    ufKinerjaMesin = state;
                  });
                },
              ),
              CheckTile(
                title: "Transmisi 4WD (jika dilengkapi)",
                state: ufTransmisi,
                onChange: (int state) {
                  setState(() {
                    ufTransmisi = state;
                  });
                },
              ),
            ],
          ),
        ),
        _title("CEK VISUAL"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              CheckTile(
                title: "Sekering (fuse)",
                state: cvSekering,
                onChange: (int state) {
                  setState(() {
                    cvSekering = state;
                  });
                },
              ),
              CheckTile(
                title:
                    "Bagian bawah kendaraan, suspensi, poros, propeller, axie",
                state: cvBagianBawah,
                onChange: (int state) {
                  setState(() {
                    cvBagianBawah = state;
                  });
                },
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: const Text("Simpan"),
            ),
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
}
