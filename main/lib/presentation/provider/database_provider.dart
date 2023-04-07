import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:main/data/datasources/local_data_source.dart';
import 'package:main/data/models/inspection_day_model.dart';
import 'package:main/data/models/inspection_model.dart';
import 'package:main/data/models/inspection_month_model.dart';
import 'package:main/data/models/inspection_week_model.dart';

enum InspectionTypes {
  inspection,
  day,
  week,
  month,
}

int generateId() {
  String id = "";

  for (int i = 0; i < 9; i++) {
    id += (Random().nextInt(10) + 1).toString();
  }

  return int.parse(id);
}

Future<int> generateInspectionId(LocalDataSourceImpl localDataSourceImpl,
    InspectionTypes inspectionTypes) async {
  int generatedId;
  int iteration = 0;

  while (true) {
    iteration += 1;
    if (iteration > 100) {
      throw 'While loop overflow error';
    }

    generatedId = generateId();

    late bool idExist;
    if (inspectionTypes == InspectionTypes.inspection) {
      idExist = await localDataSourceImpl.checkInspectionId(generatedId);
    } else if (inspectionTypes == InspectionTypes.day) {
      idExist = await localDataSourceImpl.checkInspectionDayId(generatedId);
    } else if (inspectionTypes == InspectionTypes.week) {
      idExist = await localDataSourceImpl.checkInspectionWeekId(generatedId);
    } else if (inspectionTypes == InspectionTypes.month) {
      idExist = await localDataSourceImpl.checkInspectionMonthId(generatedId);
    } else {
      throw 'unknown type: $inspectionTypes';
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

  List<InspectionDayModel> _dayInspections = []; // TODO: remove?
  List<InspectionDayModel> get dayInspections => _dayInspections;

  List<InspectionWeekModel> _weekInspections = []; // TODO: remove?
  List<InspectionWeekModel> get weekInspections => _weekInspections;

  List<InspectionMonthModel> _monthInspections = []; // TODO: remove?
  List<InspectionMonthModel> get monthInspections => _monthInspections;

  DatabaseState _databaseState = DatabaseState.noData;
  DatabaseState get databaseState => _databaseState;

  LocalDataSourceImpl localDataSourceImpl;

  int? _inspectionId;
  int? get inspectionId => _inspectionId;

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

    //! DEBUG
    _dayInspections = await localDataSourceImpl.getAllDayInspection();
    _weekInspections = await localDataSourceImpl.getAllWeekInspection();
    _monthInspections = await localDataSourceImpl.getAllMonthInspection();

    _databaseState = DatabaseState.hasData;
    notifyListeners();
  }

  void changeInspectionId(int? inspectionId) {
    _inspectionId = inspectionId;
    notifyListeners();
  }

  Future<bool> insertInspection({
    required String nomorPlat,
    required String tipeKendaraan,
    required String perusahaan,
    required String tanggal,
    required String lokasi,
  }) async {
    int generatedId = await generateInspectionId(
        localDataSourceImpl, InspectionTypes.inspection);

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

    changeInspectionId(generatedId);

    fetchInspections();
    return result;
  }

  Future<bool> insertInspectionDay({
    required int inspectionId,

    // LUAR KENDARAAN
    required int kacaDepanWiper,
    required int bodiKacaJendelaKacaBelakang,
    required int ban,
    required int lampu,
    required int pengamananBarangMuatan,

    // BAGIAN MESIN
    required int oliMesin,
    required int airRadiator,
    required int airWiper,

    // DALAM KABIN
    required int sabukPengaman,
    required int stirKlakson,
    required int dimGPSdanRFID,
    required int panelInstrumendanKontrol,
    required int pedalGasRemKopling,
    required int penempatanBarangLepasan,

    // Dokumen
    required int lisensiDanIzinMengemudi,
    required int suratKendaraan,
    required int jmpfmc,
  }) async {
    final inspection =
        await localDataSourceImpl.getInspectionById(inspectionId);

    if (inspection == null) {
      throw "Failed to update inspection";
    }

    final int id =
        await generateInspectionId(localDataSourceImpl, InspectionTypes.day);

    final List<dynamic> inspectionDay = json.decode(inspection.inspeksiHarian);
    inspectionDay.add(id);

    final updatedInspection = inspection.copyWith(
      inspeksiHarian: jsonEncode(inspectionDay),
    );

    final updatingResult = await localDataSourceImpl.updateInspection(
      InspectionModel.fromEquatable(updatedInspection),
    );

    if (!updatingResult) {
      throw "Inspection not found";
    }

    InspectionDayModel inspectionDayModel = InspectionDayModel(
      id: id,
      inspectionId: inspectionId,
      kacaDepanWiper: kacaDepanWiper,
      kacaDepanWiperFile: null,
      bodiKacaJendelaKacaBelakang: bodiKacaJendelaKacaBelakang,
      bodiKacaJendelaKacaBelakangFile: null,
      ban: ban,
      banFile: null,
      lampu: lampu,
      lampuFile: null,
      pengamananBarangMuatan: pengamananBarangMuatan,
      pengamananBarangMuatanFile: null,
      oliMesin: oliMesin,
      oliMesinFile: null,
      airRadiator: airRadiator,
      airRadiatorFile: null,
      airWiper: airWiper,
      airWiperFile: null,
      sabukPengaman: sabukPengaman,
      sabukPengamanFile: null,
      stirKlakson: stirKlakson,
      stirKlaksonFile: null,
      dimGPSdanRFID: dimGPSdanRFID,
      dimGPSdanRFIDFile: null,
      panelInstrumendanKontrol: panelInstrumendanKontrol,
      panelInstrumendanKontrolFile: null,
      pedalGasRemKopling: pedalGasRemKopling,
      pedalGasRemKoplingFile: null,
      penempatanBarangLepasan: penempatanBarangLepasan,
      penempatanBarangLepasanFile: null,
      lisensiDanIzinMengemudi: lisensiDanIzinMengemudi,
      lisensiDanIzinMengemudiFile: null,
      suratKendaraan: suratKendaraan,
      suratKendaraanFile: null,
      jmpfmc: jmpfmc,
      jmpfmcFile: null,
    );

    final result =
        await localDataSourceImpl.insertDayInspection(inspectionDayModel);

    fetchInspections();
    return result;
  }

  Future<bool> insertInspectionWeek({
    required int inspectionId,

    // BAGIAN MESIN
    required int minyakRem,
    required int minyakPowerSteering,
    required int vBelt,
    required int bateraiAki,

    // DALAM KABIN & LUAR KENDARAAN
    required int remParkir,
    required int sandaranKepalaJok,
    required int spion,
    required int bagianBawahMesindanTransmisi,
    required int banCadanganDongrakKunci,
    required int alatPemadamApiRingan,
    required int itemP3K,
    required int segitigaReflektif,
  }) async {
    final inspection =
        await localDataSourceImpl.getInspectionById(inspectionId);

    if (inspection == null) {
      throw "Failed to update inspection";
    }

    final int id =
        await generateInspectionId(localDataSourceImpl, InspectionTypes.week);

    final List<dynamic> inspectionWeek =
        json.decode(inspection.inspeksiMingguan);
    inspectionWeek.add(id);

    final updatedInspection = inspection.copyWith(
      inspeksiMingguan: jsonEncode(inspectionWeek),
    );

    final updatingResult = await localDataSourceImpl.updateInspection(
      InspectionModel.fromEquatable(updatedInspection),
    );

    if (!updatingResult) {
      throw "Inspection not found";
    }

    InspectionWeekModel inspectionWeekModel = InspectionWeekModel(
      id: id,
      inspectionId: inspectionId,
      minyakRem: minyakRem,
      minyakRemFile: null,
      minyakPowerSteering: minyakPowerSteering,
      minyakPowerSteeringFile: null,
      vBelt: vBelt,
      vBeltFile: null,
      bateraiAki: bateraiAki,
      bateraiAkiFile: null,
      remParkir: remParkir,
      remParkirFile: null,
      sandaranKepalaJok: sandaranKepalaJok,
      sandaranKepalaJokFile: null,
      spion: spion,
      spionFile: null,
      bagianBawahMesindanTransmisi: bagianBawahMesindanTransmisi,
      bagianBawahMesindanTransmisiFile: null,
      banCadanganDongrakKunci: banCadanganDongrakKunci,
      banCadanganDongrakKunciFile: null,
      alatPemadamApiRingan: alatPemadamApiRingan,
      alatPemadamApiRinganFile: null,
      itemP3K: itemP3K,
      itemP3KFile: null,
      segitigaReflektif: segitigaReflektif,
      segitigaReflektifFile: null,
    );

    final result =
        await localDataSourceImpl.insertWeekInspection(inspectionWeekModel);

    fetchInspections();
    return result;
  }

  Future<bool> insertInspectionMonth({
    required int inspectionId,

    // UJI FUNGSI
    required int kinerjaRem,
    required int kinerjaMesin,
    required int transmisi4WD,

    // CEK VISUAL
    required int sekering,
    required int bagianBawahKendaraan,
  }) async {
    final inspection =
        await localDataSourceImpl.getInspectionById(inspectionId);

    if (inspection == null) {
      throw "Failed to update inspection";
    }

    final int id =
        await generateInspectionId(localDataSourceImpl, InspectionTypes.month);

    final List<dynamic> inspectionMonth =
        json.decode(inspection.inspeksiBulanan);
    inspectionMonth.add(id);

    final updatedInspection = inspection.copyWith(
      inspeksiBulanan: jsonEncode(inspectionMonth),
    );

    final updatingResult = await localDataSourceImpl.updateInspection(
      InspectionModel.fromEquatable(updatedInspection),
    );

    if (!updatingResult) {
      throw "Inspection not found";
    }

    InspectionMonthModel inspectionMonthModel = InspectionMonthModel(
      id: id,
      inspectionId: inspectionId,
      kinerjaRem: kinerjaRem,
      kinerjaRemFile: null,
      kinerjaMesin: kinerjaMesin,
      kinerjaMesinFile: null,
      transmisi4WD: transmisi4WD,
      transmisi4WDFile: null,
      sekering: sekering,
      sekeringFile: null,
      bagianBawahKendaraan: bagianBawahKendaraan,
      bagianBawahKendaraanFile: null,
    );

    final result =
        await localDataSourceImpl.insertMonthInspection(inspectionMonthModel);

    fetchInspections();
    return result;
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
