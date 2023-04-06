import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:main/data/datasources/local_data_source.dart';
import 'package:main/data/models/inspection_day_model.dart';
import 'package:main/data/models/inspection_model.dart';
import 'package:main/data/models/inspection_month_model.dart';
import 'package:main/data/models/inspection_week_model.dart';

int generateId() {
  String id = "";

  for (int i = 0; i < 9; i++) {
    id += (Random().nextInt(10) + 1).toString();
  }

  return int.parse(id);
}

Future<int> generateInspectionId(
    LocalDataSourceImpl localDataSourceImpl, String type) async {
  int generatedId;
  int iteration = 0;

  while (true) {
    iteration += 1;
    if (iteration > 100) {
      throw 'While loop overflow error';
    }

    generatedId = generateId();

    late bool idExist;
    if (type == 'inspection') {
      idExist = await localDataSourceImpl.checkInspectionId(generatedId);
    } else if (type == 'day') {
      idExist = await localDataSourceImpl.checkInspectionDayId(generatedId);
    } else if (type == 'week') {
      idExist = await localDataSourceImpl.checkInspectionWeekId(generatedId);
    } else if (type == 'month') {
      idExist = await localDataSourceImpl.checkInspectionMonthId(generatedId);
    } else {
      throw 'unknown type: $type';
    }
    if (!idExist) {
      break;
    }
  }

  return generatedId;
}

enum DatabaseState {
  loading,
  hasData,
  noData,
  error,
}

class DatabaseProvider extends ChangeNotifier {
  List<InspectionModel> _inspections = [];
  List<InspectionModel> get inspections => _inspections;

  DatabaseState _databaseState = DatabaseState.noData;
  DatabaseState get databaseState => _databaseState;

  LocalDataSourceImpl localDataSourceImpl;

  DatabaseProvider({required this.localDataSourceImpl}) {
    fetchInspections();
  }

  void resetDatabase() async {
    await localDataSourceImpl.resetDatabase();
    dev.log("Database is resetted");
  }

  void fetchInspections() async {
    _databaseState = DatabaseState.loading;
    notifyListeners();

    List<InspectionModel> result = await localDataSourceImpl.getAllInspection();
    _inspections = result;

    _databaseState = DatabaseState.hasData;
    notifyListeners();
  }

  Future<bool> insertInspection({
    required String nomorPlat,
    required String tipeKendaraan,
    required String perusahaan,
    required String tanggal,
    required String lokasi,
  }) async {
    int generatedId =
        await generateInspectionId(localDataSourceImpl, "inspection");

    InspectionModel inspectionModel = InspectionModel(
      id: generatedId,
      nomorPlat: nomorPlat,
      tipeKendaraan: tipeKendaraan,
      perusahaan: perusahaan,
      tanggal: tanggal,
      lokasi: lokasi,
      inspeksiHarian: jsonEncode([]),
      inspeksiMingguan: jsonEncode([]),
      inspeksiBulanan: jsonEncode([]),
    );

    final result = await localDataSourceImpl.insertInspection(inspectionModel);

    fetchInspections();
    return result;
  }

  Future<bool> insertInspectionDay(
      InspectionDayModel inspectionDayModel) async {
    final inspection = await localDataSourceImpl
        .getInspectionById(inspectionDayModel.inspectionId);

    if (inspection != null) {
      final inspectionDay = json.decode(inspection.inspeksiHarian);
      final updatedInspection =
          inspection.copyWith(inspeksiHarian: inspectionDay);

      final updatingResult = await localDataSourceImpl.updateInspection(
        InspectionModel.fromEquatable(updatedInspection),
      );

      if (updatingResult) {
        final result =
            await localDataSourceImpl.insertDayInspection(inspectionDayModel);

        fetchInspections();
        return result;
      } else {
        throw "Failed to update inspection";
      }
    } else {
      throw "Inspection not found";
    }
  }

  void insertInspectionWeek() {
    // TODO:
  }

  void insertInspectionMonth() {
    // TODO:
  }

  void debug() async {
    _databaseState = DatabaseState.loading;
    notifyListeners();

    int generatedId;

    int iteration = 0;
    while (true) {
      iteration += 1;

      if (iteration > 100) {
        throw 'While loop overflow error';
      }

      generatedId = generateId();

      bool idExist = await localDataSourceImpl.checkInspectionId(generatedId);

      if (!idExist) {
        break;
      }
    }

    dev.log("id: $generatedId");

    String inspeksiHarian = jsonEncode(
      [],
    );

    String inspeksiMingguan = jsonEncode(
      [],
    );

    String inspeksiBulanan = jsonEncode(
      [],
    );

    InspectionModel inspectionModel = InspectionModel(
      id: generatedId,
      nomorPlat: "placeholder of $generatedId",
      tipeKendaraan: "placeholder of $generatedId",
      perusahaan: "placeholder of $generatedId",
      tanggal: "placeholder of $generatedId",
      lokasi: "placeholder of $generatedId",
      inspeksiHarian: inspeksiHarian,
      inspeksiMingguan: inspeksiMingguan,
      inspeksiBulanan: inspeksiBulanan,
    );

    final insertResult =
        await localDataSourceImpl.insertInspection(inspectionModel);

    dev.log("data inserted, status: $insertResult");

    InspectionDayModel inspectionDayModel = InspectionDayModel(
      id: generatedId,
      inspectionId: generatedId,
      kacaDepanWiper: 1,
      kacaDepanWiperFile: null,
      bodiKacaJendelaKacaBelakang: 1,
      bodiKacaJendelaKacaBelakangFile: null,
      ban: 1,
      banFile: null,
      lampu: 1,
      lampuFile: null,
      pengamananBarangMuatan: 1,
      pengamananBarangMuatanFile: null,
      oliMesin: 1,
      oliMesinFile: null,
      airRadiator: 1,
      airRadiatorFile: null,
      airWiper: 1,
      airWiperFile: null,
      sabukPengaman: 1,
      sabukPengamanFile: null,
      stirKlakson: 1,
      stirKlaksonFile: null,
      dimGPSdanRFID: 1,
      dimGPSdanRFIDFile: null,
      panelInstrumendanKontrol: 1,
      panelInstrumendanKontrolFile: null,
      pedalGasRemKopling: 1,
      pedalGasRemKoplingFile: null,
      penempatanBarangLepasan: 1,
      penempatanBarangLepasanFile: null,
      lisensiDanIzinMengemudi: 1,
      lisensiDanIzinMengemudiFile: null,
      suratKendaraan: 1,
      suratKendaraanFile: null,
      jmpfmc: 1,
      jmpfmcFile: null,
    );

    InspectionWeekModel inspectionWeekModel = InspectionWeekModel(
      id: generatedId,
      inspectionId: generatedId,
      minyakRem: 1,
      minyakRemFile: null,
      minyakPowerSteering: 1,
      minyakPowerSteeringFile: null,
      vBelt: 1,
      vBeltFile: null,
      bateraiAki: 1,
      bateraiAkiFile: null,
      remParkir: 1,
      remParkirFile: null,
      sandaranKepalaJok: 1,
      sandaranKepalaJokFile: null,
      spion: 1,
      spionFile: null,
      bagianBawahMesindanTransmisi: 1,
      bagianBawahMesindanTransmisiFile: null,
      banCadanganDongrakKunci: 1,
      banCadanganDongrakKunciFile: null,
      alatPemadamApiRingan: 1,
      alatPemadamApiRinganFile: null,
      itemP3K: 1,
      itemP3KFile: null,
      segitigaReflektif: 1,
      segitigaReflektifFile: null,
    );

    InspectionMonthModel inspectionMonthModel = InspectionMonthModel(
      id: generatedId,
      inspectionId: generatedId,
      kinerjaRem: 1,
      kinerjaRemFile: null,
      kinerjaMesin: 1,
      kinerjaMesinFile: null,
      transmisi4WD: 1,
      transmisi4WDFile: null,
      sekering: 1,
      sekeringFile: null,
      bagianBawahKendaraan: 1,
      bagianBawahKendaraanFile: null,
    );

    await localDataSourceImpl.insertDayInspection(inspectionDayModel);
    await localDataSourceImpl.insertWeekInspection(inspectionWeekModel);
    await localDataSourceImpl.insertMonthInspection(inspectionMonthModel);

    InspectionModel? inspeksi =
        await localDataSourceImpl.getInspectionById(generatedId);

    if (inspeksi != null) {
      final List<dynamic> uiHari = json.decode(inspeksi.inspeksiHarian);
      uiHari.add(10);

      final List<dynamic> uiMinggu = json.decode(inspeksi.inspeksiMingguan);
      uiMinggu.add(20);

      final List<dynamic> uiBulan = json.decode(inspeksi.inspeksiHarian);
      uiBulan.add(30);

      InspectionModel inspeksiUpdate = InspectionModel.fromEquatable(
        inspeksi.copyWith(
          inspeksiHarian: jsonEncode(uiHari),
          inspeksiMingguan: jsonEncode(uiMinggu),
          inspeksiBulanan: jsonEncode(uiBulan),
        ),
      );

      final updateResult =
          await localDataSourceImpl.updateInspection(inspeksiUpdate);

      dev.log("Updated, status: $updateResult");
    } else {
      if (inspeksi != null) {
        dev.log("${inspeksi.id} is null");
      } else {
        dev.log("inspeksi is null");
      }
    }

    fetchInspections();
    dev.log('fetched: $_inspections');
  }
}
