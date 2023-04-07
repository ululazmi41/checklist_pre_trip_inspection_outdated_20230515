import 'dart:io';

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

  @override
  Widget build(BuildContext context) {
    // TODO: Warning when inspectionId is not given on onPop
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
            child: SingleChildScrollView(
              child: content(),
            ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Text("Tanggal"),
            Text(
              "29 Maret 2023",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
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
