import 'dart:io';

import 'package:flutter/material.dart';
import 'package:main/presentation/components/check_tile.dart';

class InspectionWeek extends StatefulWidget {
  const InspectionWeek({super.key});

  @override
  State<InspectionWeek> createState() => InspectionWeekState();
}

class InspectionWeekState extends State<InspectionWeek> {
  /* BAGIAN MESIN - matikan mesin */
  int bmMinyakRem = 0;
  int bmMinyakPowerSteering = 0;
  int bmVBelt = 0;
  int bmBateraiAki = 0;

  /* Dalam Kabin dan Luar Kendaraan */
  int dkRemParkir = 0;
  int dkSandaranKepaladanJok = 0;
  int dkSpion = 0;
  int dkBagianBawahMesindanTransmisi = 0;
  int dkBanCadanganDongkrakKunci = 0;
  int dkAlatPemadamApiRingan = 0;
  int dkItemP3K = 0;
  int dkSegitigaReflektif = 0;

  File? photofile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inspeksi Mingguan"),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              top: 12.0,
              right: 24.0,
              bottom: 36.0,
            ),
            child: SingleChildScrollView(child: content()),
          ),
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
        _title("BAGIAN MESIN - matikan mesin"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              CheckTile(
                title: "MINYAK REM",
                state: bmMinyakRem,
                onChange: (int state) {
                  setState(() {
                    bmMinyakRem = state;
                  });
                },
              ),
              CheckTile(
                title: "MINYAK POWER + STEERING",
                state: bmMinyakPowerSteering,
                onChange: (int state) {
                  setState(() {
                    bmMinyakPowerSteering = state;
                  });
                },
              ),
              CheckTile(
                title: "V-BELT",
                state: bmVBelt,
                onChange: (int state) {
                  setState(() {
                    bmVBelt = state;
                  });
                },
              ),
              CheckTile(
                title: "Baterai Aki",
                state: bmBateraiAki,
                onChange: (int state) {
                  setState(() {
                    bmBateraiAki = state;
                  });
                },
              ),
            ],
          ),
        ),
        _title("DALAM KABIN & LUAR KENDARAAN"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              CheckTile(
                title: "REM PARKIR",
                state: dkRemParkir,
                onChange: (int state) {
                  setState(() {
                    dkRemParkir = state;
                  });
                },
              ),
              CheckTile(
                title: "SANDARAN KEPALA & Jok",
                state: dkSandaranKepaladanJok,
                onChange: (int state) {
                  setState(() {
                    dkSandaranKepaladanJok = state;
                  });
                },
              ),
              CheckTile(
                title: "SPION KIRI & KANAN, tengah",
                state: dkSpion,
                onChange: (int state) {
                  setState(() {
                    dkSpion = state;
                  });
                },
              ),
              CheckTile(
                title: "Bagian Bawah mesin & transmisi",
                state: dkBagianBawahMesindanTransmisi,
                onChange: (int state) {
                  setState(() {
                    dkBagianBawahMesindanTransmisi = state;
                  });
                },
              ),
              CheckTile(
                title: "Ban Cadangan, dongkrak, kunci\"",
                state: dkBanCadanganDongkrakKunci,
                onChange: (int state) {
                  setState(() {
                    dkBanCadanganDongkrakKunci = state;
                  });
                },
              ),
              CheckTile(
                title: "Alat Pemadam Api Ringan",
                state: dkAlatPemadamApiRingan,
                onChange: (int state) {
                  setState(() {
                    dkAlatPemadamApiRingan = state;
                  });
                },
              ),
              CheckTile(
                title: "Item P3K",
                state: dkItemP3K,
                onChange: (int state) {
                  setState(() {
                    dkItemP3K = state;
                  });
                },
              ),
              CheckTile(
                title: "Segitiga Reflektif",
                state: dkSegitigaReflektif,
                onChange: (int state) {
                  setState(() {
                    dkSegitigaReflektif = state;
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
