import 'dart:io';

import 'package:flutter/material.dart';
import 'package:main/presentation/components/check_tile.dart';

class InspectionDay extends StatefulWidget {
  const InspectionDay({super.key});

  @override
  State<InspectionDay> createState() => InspectionDayState();
}

class InspectionDayState extends State<InspectionDay> {
  /* Luar Kendaraan */
  int lkKacaDepandanWiper = 0;
  int lkBodyKacaJendelaKacaBelakang = 0;
  int lkBanDepanBelakang = 0;
  int lkLampu = 0;
  int lkPengamananBarangMuatan = 0;

  /* Bagian Mesin */
  int bmOliMesin = 0;
  int bmAirRadiator = 0;
  int bmAirWiper = 0;

  /* Dalam Kabin */
  int dkSabukPengaman = 0;
  int dkStirdanKlakson = 0;
  int dkDimGPSdanRFID = 0;
  int dkPanelInstrumendanKontrol = 0;
  int dkPedalGasRemKopling = 0;

  /* Dokumen */
  int dLisensidanIzinMengemudi = 0;
  int dLSuratKendaraan = 0;
  int dLJMPFMJ = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inspeksi Harian"),
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

  File? photofile;

  Widget content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   'You have pushed the button this many times with $hello and $condition:',
        // ),
        // Text(
        //   '$_counter',
        //   style: Theme.of(context).textTheme.headline4,
        // ),
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
        _title("LUAR KENDARAAN"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              CheckTile(
                title: "KACA DEPAN + WIPER",
                state: lkKacaDepandanWiper,
                onChange: (int state) {
                  setState(() {
                    lkKacaDepandanWiper = state;
                  });
                },
              ),
              CheckTile(
                title: "Bodi + Kaca Jendela + Kaca Belakang",
                state: lkBodyKacaJendelaKacaBelakang,
                onChange: (int state) {
                  setState(() {
                    lkBodyKacaJendelaKacaBelakang = state;
                  });
                },
              ),
              CheckTile(
                title: "BAN DEPAN + BELAKANG",
                state: lkBanDepanBelakang,
                onChange: (int state) {
                  setState(() {
                    lkBanDepanBelakang = state;
                  });
                },
              ),
              CheckTile(
                title:
                    "LAMPU-LAMPU (LAMPU UTAMA, LAMPU REM, LAMPU SEIN, LAMPU HAZARD, LAMPU MUNDUR)",
                state: lkLampu,
                onChange: (int state) {
                  setState(() {
                    lkLampu = state;
                  });
                },
              ),
              CheckTile(
                title: "PENGAMANAN BARANG MUATAN",
                state: lkPengamananBarangMuatan,
                onChange: (int state) {
                  setState(() {
                    lkPengamananBarangMuatan = state;
                  });
                },
              ),
            ],
          ),
        ),
        _title("BAGIAN MESIN"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              CheckTile(
                title: "OLI MESIN",
                state: bmOliMesin,
                onChange: (int state) {
                  setState(() {
                    bmOliMesin = state;
                  });
                },
              ),
              CheckTile(
                title: "AIR RADIATOR",
                state: bmAirRadiator,
                onChange: (int state) {
                  setState(() {
                    bmAirRadiator = state;
                  });
                },
              ),
              CheckTile(
                title: "AIR WIPER",
                state: bmAirWiper,
                onChange: (int state) {
                  setState(() {
                    bmAirWiper = state;
                  });
                },
              ),
            ],
          ),
        ),
        _title("DALAM KABIN"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              CheckTile(
                title: "SABUK PENGAMAN",
                state: dkSabukPengaman,
                onChange: (int state) {
                  setState(() {
                    dkSabukPengaman = state;
                  });
                },
              ),
              CheckTile(
                title: "STIR & KLAKSON",
                state: dkSabukPengaman,
                onChange: (int state) {
                  setState(() {
                    dkSabukPengaman = state;
                  });
                },
              ),
              CheckTile(
                title: "DIM GPS dan RFID",
                state: dkDimGPSdanRFID,
                onChange: (int state) {
                  setState(() {
                    dkDimGPSdanRFID = state;
                  });
                },
              ),
              CheckTile(
                title: "PANEL INSTRUMEN dan KONTROL",
                state: dkPanelInstrumendanKontrol,
                onChange: (int state) {
                  setState(() {
                    dkPanelInstrumendanKontrol = state;
                  });
                },
              ),
              CheckTile(
                title: "PEDAL GAS, REM, KOPLING",
                state: dkPedalGasRemKopling,
                onChange: (int state) {
                  setState(() {
                    dkPedalGasRemKopling = state;
                  });
                },
              ),
              CheckTile(
                title:
                    "PENEMPATAN BARANG LEPASAN (LOOSE ITEM) + kebersihan kabin",
                state: dkDimGPSdanRFID,
                onChange: (int state) {
                  setState(() {
                    dkDimGPSdanRFID = state;
                  });
                },
              ),
            ],
          ),
        ),
        _title("DOKUMEN"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              CheckTile(
                title: "LISENSI & IZIN MENGEMUDI (SIM KP)",
                state: dLisensidanIzinMengemudi,
                onChange: (int state) {
                  setState(() {
                    dLisensidanIzinMengemudi = state;
                  });
                },
              ),
              CheckTile(
                title:
                    "SURAT KENDARAAN (STNK + PLAT NOMOR, PASS KENDARAAN, KIR - khusus mobil pickup / plat kuning)",
                state: dLSuratKendaraan,
                onChange: (int state) {
                  setState(() {
                    dLSuratKendaraan = state;
                  });
                },
              ),
              CheckTile(
                title:
                    "Journey Management Plan (JMP); Fatigue Management Checklist (FMC)",
                state: dLJMPFMJ,
                onChange: (int state) {
                  setState(() {
                    dLJMPFMJ = state;
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
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
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
