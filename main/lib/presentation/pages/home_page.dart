import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

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

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inspeksi Harian"),
      ),
      body: Center(
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
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
        ElevatedButton(
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? photo =
                await picker.pickImage(source: ImageSource.camera);

            if (photo != null) {
              setState(() {
                photofile = File(photo.path);
              });
            }
          },
          child: const Text("Kamera"),
        ),
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
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Item",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: const [
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
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Container(
            height: 2.0,
            color: Colors.black87,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "LUAR KENDARAAN",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              CheckBox(
                photofile: photofile,
                title: "KACA DEPAN + WIPER",
                state: lkKacaDepandanWiper,
                onChange: (int state) {
                  setState(() {
                    lkKacaDepandanWiper = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
                title: "Bodi + Kaca Jendela + Kaca Belakang",
                state: lkBodyKacaJendelaKacaBelakang,
                onChange: (int state) {
                  setState(() {
                    lkBodyKacaJendelaKacaBelakang = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
                title: "BAN DEPAN + BELAKANG",
                state: lkBanDepanBelakang,
                onChange: (int state) {
                  setState(() {
                    lkBanDepanBelakang = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
                title:
                    "LAMPU-LAMPU (LAMPU UTAMA, LAMPU REM, LAMPU SEIN, LAMPU HAZARD, LAMPU MUNDUR)",
                state: lkLampu,
                onChange: (int state) {
                  setState(() {
                    lkLampu = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "BAGIAN MESIN",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              CheckBox(
                photofile: null,
                title: "OLI MESIN",
                state: bmOliMesin,
                onChange: (int state) {
                  setState(() {
                    bmOliMesin = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
                title: "AIR RADIATOR",
                state: bmAirRadiator,
                onChange: (int state) {
                  setState(() {
                    bmAirRadiator = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "DALAM KABIN",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              CheckBox(
                photofile: null,
                title: "SABUK PENGAMAN",
                state: dkSabukPengaman,
                onChange: (int state) {
                  setState(() {
                    dkSabukPengaman = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
                title: "STIR & KLAKSON",
                state: dkSabukPengaman,
                onChange: (int state) {
                  setState(() {
                    dkSabukPengaman = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
                title: "DIM GPS dan RFID",
                state: dkDimGPSdanRFID,
                onChange: (int state) {
                  setState(() {
                    dkDimGPSdanRFID = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
                title: "PANEL INSTRUMEN dan KONTROL",
                state: dkPanelInstrumendanKontrol,
                onChange: (int state) {
                  setState(() {
                    dkPanelInstrumendanKontrol = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
                title: "PEDAL GAS, REM, KOPLING",
                state: dkPedalGasRemKopling,
                onChange: (int state) {
                  setState(() {
                    dkPedalGasRemKopling = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              "DOKUMEN",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              CheckBox(
                photofile: null,
                title: "LISENSI & IZIN MENGEMUDI (SIM KP)",
                state: dLisensidanIzinMengemudi,
                onChange: (int state) {
                  setState(() {
                    dLisensidanIzinMengemudi = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
                title:
                    "SURAT KENDARAAN (STNK + PLAT NOMOR, PASS KENDARAAN, KIR - khusus mobil pickup / plat kuning)",
                state: dLSuratKendaraan,
                onChange: (int state) {
                  setState(() {
                    dLSuratKendaraan = state;
                  });
                },
              ),
              CheckBox(
                photofile: null,
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
              child: const Text("Simpan"),
            ),
          ],
        ),
      ],
    );
  }
}

class CheckBox extends StatefulWidget {
  const CheckBox({
    Key? key,
    required this.title,
    required this.state,
    required this.onChange,
    required this.photofile,
  }) : super(key: key);

  final String title;
  final int state;
  final Function onChange;
  final File? photofile;

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  int state = 0;

  @override
  void initState() {
    state = widget.state;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: (() {
                  setState(() {
                    if (state < 3) {
                      state += 1;
                    } else {
                      state = 0;
                    }

                    widget.onChange(state);
                  });
                }),
                child: _conditionalContainer(state),
              ),
              const SizedBox(width: 32.0),
              widget.photofile != null
                  ? Image.file(widget.photofile!, width: 24.0, height: 24.0)
                  : const Icon(Icons.camera_alt),
              const SizedBox(width: 4.0),
            ],
          ),
        ],
      ),
    );
  }

  Container _conditionalContainer(int state) {
    if (state == 0) {
      return Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
        ),
      );
    } else if (state == 1) {
      return Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: const Icon(
          Icons.check,
          size: 18,
          color: Colors.white,
        ),
      );
    } else if (state == 2) {
      return Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        child: const Icon(
          Icons.remove,
          size: 18,
          color: Colors.white,
        ),
      );
    } else if (state == 3) {
      return Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.redAccent,
        ),
        child: const Icon(
          Icons.close,
          size: 18,
          color: Colors.white,
        ),
      );
    } else {
      BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
      );
    }

    return Container();
  }
}
