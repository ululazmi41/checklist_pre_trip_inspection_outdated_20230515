import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/presentation/components/check_tile.dart';
import 'package:main/presentation/provider/database_provider.dart';
import 'package:provider/provider.dart';

class InspectionWeek extends StatefulWidget {
  const InspectionWeek({super.key});

  @override
  State<InspectionWeek> createState() => InspectionWeekState();
}

class InspectionWeekState extends State<InspectionWeek> {
  /* BAGIAN MESIN - matikan mesin */
  int minyakRem = 0;
  int minyakPowerSteering = 0;
  int vBelt = 0;
  int bateraiAki = 0;

  /* Dalam Kabin dan Luar Kendaraan */
  int remParkir = 0;
  int sandaranKepalaJok = 0;
  int spion = 0;
  int bagianBawahMesindanTransmisi = 0;
  int banCadanganDongrakKunci = 0; // TODO: TYPO
  int alatPemadamApiRingan = 0;
  int itemP3K = 0;
  int segitigaReflektif = 0;

  File? photofile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inspeksi Mingguan"),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
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
      ),
    );
  }

  Widget content() {
    return Column(
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
        _title("BAGIAN MESIN - matikan mesin"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _bagianMesin(),
        ),
        _title("DALAM KABIN & LUAR KENDARAAN"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _dalamKabin(),
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

  Widget _bagianMesin() {
    return Column(
      children: <Widget>[
        CheckTile(
          title: "MINYAK REM",
          state: minyakRem,
          onChange: (int state) {
            setState(() {
              minyakRem = state;
            });
          },
        ),
        CheckTile(
          title: "MINYAK POWER + STEERING",
          state: minyakPowerSteering,
          onChange: (int state) {
            setState(() {
              minyakPowerSteering = state;
            });
          },
        ),
        CheckTile(
          title: "V-BELT",
          state: vBelt,
          onChange: (int state) {
            setState(() {
              vBelt = state;
            });
          },
        ),
        CheckTile(
          title: "Baterai Aki",
          state: bateraiAki,
          onChange: (int state) {
            setState(() {
              bateraiAki = state;
            });
          },
        ),
      ],
    );
  }

  Widget _dalamKabin() {
    return Column(
      children: <Widget>[
        CheckTile(
          title: "REM PARKIR",
          state: remParkir,
          onChange: (int state) {
            setState(() {
              remParkir = state;
            });
          },
        ),
        CheckTile(
          title: "SANDARAN KEPALA & Jok",
          state: sandaranKepalaJok,
          onChange: (int state) {
            setState(() {
              sandaranKepalaJok = state;
            });
          },
        ),
        CheckTile(
          title: "SPION KIRI & KANAN, tengah",
          state: spion,
          onChange: (int state) {
            setState(() {
              spion = state;
            });
          },
        ),
        CheckTile(
          title: "Bagian Bawah mesin & transmisi",
          state: bagianBawahMesindanTransmisi,
          onChange: (int state) {
            setState(() {
              bagianBawahMesindanTransmisi = state;
            });
          },
        ),
        CheckTile(
          title: "Ban Cadangan, dongkrak, kunci\"",
          state: banCadanganDongrakKunci, // TODO: TYPO
          onChange: (int state) {
            setState(() {
              banCadanganDongrakKunci = state; // TODO: TYPO
            });
          },
        ),
        CheckTile(
          title: "Alat Pemadam Api Ringan",
          state: alatPemadamApiRingan,
          onChange: (int state) {
            setState(() {
              alatPemadamApiRingan = state;
            });
          },
        ),
        CheckTile(
          title: "Item P3K",
          state: itemP3K,
          onChange: (int state) {
            setState(() {
              itemP3K = state;
            });
          },
        ),
        CheckTile(
          title: "Segitiga Reflektif",
          state: segitigaReflektif,
          onChange: (int state) {
            setState(() {
              segitigaReflektif = state;
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

            context.read<DatabaseProvider>().insertInspectionWeek(
                  inspectionId: value.inspectionId!,
                  minyakRem: minyakRem,
                  minyakPowerSteering: minyakPowerSteering,
                  vBelt: vBelt,
                  bateraiAki: bateraiAki,
                  remParkir: remParkir,
                  sandaranKepalaJok: sandaranKepalaJok,
                  spion: spion,
                  bagianBawahMesindanTransmisi: bagianBawahMesindanTransmisi,
                  banCadanganDongrakKunci: banCadanganDongrakKunci,
                  alatPemadamApiRingan: alatPemadamApiRingan,
                  itemP3K: itemP3K,
                  segitigaReflektif: segitigaReflektif,
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
