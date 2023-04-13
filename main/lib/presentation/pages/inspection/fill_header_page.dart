import 'package:core/core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:main/presentation/provider/database_provider.dart';

class FillHeaderPage extends StatefulWidget {
  const FillHeaderPage({super.key, required this.type});

  final String type;

  @override
  State<FillHeaderPage> createState() => IFillHeaderPageState();
}

class IFillHeaderPageState extends State<FillHeaderPage> {
  TextEditingController nomorPlat = TextEditingController();
  TextEditingController tipeKendaraan = TextEditingController();
  TextEditingController perusahaan = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController lokasi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Inspeksi"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _inputField(
              nomorPlat,
              "Nomor plat / unit kendaraan",
              "ex: BM 1234..",
            ),
            _inputField(
              tipeKendaraan,
              "Tipe Kendaraan",
              "ex: HILUX..",
            ),
            _inputField(
              perusahaan,
              "Perusahaan / dept. user",
              "ex: Lintasarta..",
            ),
            _inputField(
              tanggal,
              "Minggu",
              "ex: IV..",
            ),
            _inputField(
              lokasi,
              "Lokasi",
              "ex: Area PHR..",
            ),
            _submitButton(),
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ElevatedButton(
          onPressed: () async {
            context.read<DatabaseProvider>().insertInspection(
                  nomorPlat: nomorPlat.text,
                  tipeKendaraan: tipeKendaraan.value.text,
                  perusahaan: perusahaan.text,
                  tanggal: tanggal.text,
                  lokasi: lokasi.text,
                );

            if (widget.type == 'daily') {
              Navigator.of(context).pushNamed(
                itDailyInspectionRoute,
              );
            } else if (widget.type == 'weekly') {
              Navigator.of(context).pushNamed(
                itWeeklyInspectionRoute,
              );
            } else if (widget.type == 'monthly') {
              Navigator.of(context).pushNamed(
                itMonthlyInspectionRoute,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
          ),
          child: const Text("Mulai Inspeksi"),
        ),
      ],
    );
  }

  Widget _inputField(
      TextEditingController controller, String labelText, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }

  @override
  void dispose() {
    nomorPlat.dispose();
    tipeKendaraan.dispose();
    perusahaan.dispose();
    tanggal.dispose();
    lokasi.dispose();

    super.dispose();
  }
}
