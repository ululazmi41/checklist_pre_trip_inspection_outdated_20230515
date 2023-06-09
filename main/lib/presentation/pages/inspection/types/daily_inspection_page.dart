import 'dart:io';

import 'package:core/core.dart';
import 'package:main/presentation/provider/database_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:main/presentation/components/check_tile.dart';

class InspectionDay extends StatefulWidget {
  const InspectionDay({super.key});

  @override
  State<InspectionDay> createState() => InspectionDayState();
}

class InspectionDayState extends State<InspectionDay> {
  /* Luar Kendaraan */
  int kacaDepanWiper = 0;
  int bodiKacaJendelaKacaBelakang = 0;
  int ban = 0;
  int lampu = 0;
  int pengamananBarangMuatan = 0;

  /* Bagian Mesin */
  int oliMesin = 0;
  int airRadiator = 0;
  int airWiper = 0;

  /* Dalam Kabin */
  int sabukPengaman = 0;
  int stirKlakson = 0;
  int dimGPSdanRFID = 0;
  int panelInstrumendanKontrol = 0;
  int pedalGasRemKopling = 0;
  int penempatanBarangLepasan = 0;

  /* Dokumen */
  int lisensiDanIzinMengemudi = 0;
  int suratKendaraan = 0;
  int jmpfmc = 0;

  bool infoVisibility = false;

  @override
  Widget build(BuildContext context) {
    // TODO: Warning when inspectionId is not given on onPop
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inspeksi Harian"),
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

  File? photofile;

  Widget content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14.0,
            vertical: 8.0,
          ),
          margin: const EdgeInsets.only(bottom: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Text(
                "29 Maret 2023",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              infoVisibility = !infoVisibility;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("Petunjuk"),
                ),
                Icon(
                  infoVisibility ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ],
            ),
          ),
        ),
        infoVisibility ? const SizedBox(height: 8.0) : Container(),
        infoVisibility
            ? const Text(
                "1. Kelilingi kendaraan 360° untuk kondisi setiap item di luar, dalam, dan bagian mesin. Matikan mesin saat menginspeksi bagian mesin.",
                style: TextStyle(fontSize: 11.0),
              )
            : Container(),
        infoVisibility
            ? const Text(
                "2. Isi kolom ☐ dengan \"X\" jika kondisi setiap item di luar, dalam, dan bagian mesin. Matikan mesin saat menginspeksi bagian mesin..",
                style: TextStyle(fontSize: 11.0),
              )
            : Container(),
        _title("LUAR KENDARAAN"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _luarKendaraan(),
        ),
        _title("BAGIAN MESIN"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _bagianMesin(),
        ),
        _title("DALAM KABIN"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _dalamKabin(),
        ),
        _title("DOKUMEN"),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _dokumen(),
        ),
        const SizedBox(height: 12.0),
        Container(
          height: 2.0,
          color: Colors.grey,
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Text(
              "KM Awal",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'km awal...',
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Icon(
                Icons.camera_alt,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Text(
              "KM Akhir",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'km akhir...',
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Icon(
                Icons.camera_alt,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          // TODO: use proper widget
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
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

  Widget _luarKendaraan() {
    return Column(
      children: <Widget>[
        CheckTile(
          title: "KACA DEPAN + WIPER",
          state: kacaDepanWiper,
          onChange: (int state) {
            setState(() {
              kacaDepanWiper = state;
            });
          },
        ),
        CheckTile(
          title: "Bodi + Kaca Jendela + Kaca Belakang",
          state: bodiKacaJendelaKacaBelakang,
          onChange: (int state) {
            setState(() {
              bodiKacaJendelaKacaBelakang = state;
            });
          },
        ),
        CheckTile(
          title: "BAN DEPAN + BELAKANG",
          state: ban,
          onChange: (int state) {
            setState(() {
              ban = state;
            });
          },
        ),
        CheckTile(
          title:
              "LAMPU-LAMPU (LAMPU UTAMA, LAMPU REM, LAMPU SEIN, LAMPU HAZARD, LAMPU MUNDUR)",
          state: lampu,
          onChange: (int state) {
            setState(() {
              lampu = state;
            });
          },
        ),
        CheckTile(
          title: "PENGAMANAN BARANG MUATAN",
          state: pengamananBarangMuatan,
          onChange: (int state) {
            setState(() {
              pengamananBarangMuatan = state;
            });
          },
        ),
      ],
    );
  }

  Widget _bagianMesin() {
    return Column(
      children: <Widget>[
        CheckTile(
          title: "OLI MESIN",
          state: oliMesin,
          onChange: (int state) {
            setState(() {
              oliMesin = state;
            });
          },
        ),
        CheckTile(
          title: "AIR RADIATOR",
          state: airRadiator,
          onChange: (int state) {
            setState(() {
              airRadiator = state;
            });
          },
        ),
        CheckTile(
          title: "AIR WIPER",
          state: airWiper,
          onChange: (int state) {
            setState(() {
              airWiper = state;
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
          title: "SABUK PENGAMAN",
          state: sabukPengaman,
          onChange: (int state) {
            setState(() {
              sabukPengaman = state;
            });
          },
        ),
        CheckTile(
          title: "STIR & KLAKSON",
          state: stirKlakson,
          onChange: (int state) {
            setState(() {
              stirKlakson = state;
            });
          },
        ),
        CheckTile(
          title: "DIM GPS dan RFID",
          state: dimGPSdanRFID,
          onChange: (int state) {
            setState(() {
              dimGPSdanRFID = state;
            });
          },
        ),
        CheckTile(
          title: "PANEL INSTRUMEN dan KONTROL",
          state: panelInstrumendanKontrol,
          onChange: (int state) {
            setState(() {
              panelInstrumendanKontrol = state;
            });
          },
        ),
        CheckTile(
          title: "PEDAL GAS, REM, KOPLING",
          state: pedalGasRemKopling,
          onChange: (int state) {
            setState(() {
              pedalGasRemKopling = state;
            });
          },
        ),
        CheckTile(
          title: "PENEMPATAN BARANG LEPASAN (LOOSE ITEM) + kebersihan kabin",
          state: penempatanBarangLepasan,
          onChange: (int state) {
            setState(() {
              penempatanBarangLepasan = state;
            });
          },
        ),
      ],
    );
  }

  Widget _dokumen() {
    return Column(
      children: [
        CheckTile(
          title: "LISENSI & IZIN MENGEMUDI (SIM KP)",
          state: lisensiDanIzinMengemudi,
          onChange: (int state) {
            setState(() {
              lisensiDanIzinMengemudi = state;
            });
          },
        ),
        CheckTile(
          title:
              "SURAT KENDARAAN (STNK + PLAT NOMOR, PASS KENDARAAN, KIR - khusus mobil pickup / plat kuning)",
          state: suratKendaraan,
          onChange: (int state) {
            setState(() {
              suratKendaraan = state;
            });
          },
        ),
        CheckTile(
          title:
              "Journey Management Plan (JMP); Fatigue Management Checklist (FMC)",
          state: jmpfmc,
          onChange: (int state) {
            setState(() {
              jmpfmc = state;
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

            context.read<DatabaseProvider>().insertInspectionDay(
                  inspectionId: value.inspectionId!,
                  kacaDepanWiper: kacaDepanWiper,
                  bodiKacaJendelaKacaBelakang: bodiKacaJendelaKacaBelakang,
                  ban: ban,
                  lampu: lampu,
                  pengamananBarangMuatan: pengamananBarangMuatan,
                  oliMesin: oliMesin,
                  airRadiator: airRadiator,
                  airWiper: airWiper,
                  sabukPengaman: sabukPengaman,
                  stirKlakson: stirKlakson,
                  dimGPSdanRFID: dimGPSdanRFID,
                  panelInstrumendanKontrol: panelInstrumendanKontrol,
                  pedalGasRemKopling: pedalGasRemKopling,
                  penempatanBarangLepasan: penempatanBarangLepasan,
                  lisensiDanIzinMengemudi: lisensiDanIzinMengemudi,
                  suratKendaraan: suratKendaraan,
                  jmpfmc: jmpfmc,
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
