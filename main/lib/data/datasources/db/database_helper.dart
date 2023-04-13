import 'package:main/data/models/inspection_day_model.dart';
import 'package:main/data/models/inspection_model.dart';
import 'package:main/data/models/inspection_month_model.dart';
import 'package:main/data/models/inspection_week_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  static const String _tblInspection = 'inspection';
  static const String _tblInspectionDay = 'day';
  static const String _tblInspectionWeek = 'week';
  static const String _tblInspectionMonth = 'month';

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/inspection.db';

    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
      // password: "password",
      //? sqflite_cipher is causing force close on installation, but not debugging
    );
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblInspection (
        id INTEGER PRIMARY KEY,
        nomorPlat TEXT,
        tipeKendaraan TEXT,
        perusahaan TEXT,
        tanggal TEXT,
        lokasi TEXT,
        inspeksiHarian TEXT,
        inspeksiMingguan TEXT,
        inspeksiBulanan TEXT
      );
    ''');

    // TODO: FOREIGN KEY

    await db.execute('''
      CREATE TABLE $_tblInspectionDay (
        id INTEGER PRIMARY KEY,
        inspectionId INTEGER,
        kacaDepanWiper INTEGER,
        kacaDepanWiperFile TEXT,
        bodiKacaJendelaKacaBelakang INTEGER,
        bodiKacaJendelaKacaBelakangFile TEXT,
        ban INTEGER,
        banFile TEXT,
        lampu INTEGER,
        lampuFile TEXT,
        pengamananBarangMuatan INTEGER,
        pengamananBarangMuatanFile TEXT,
        oliMesin INTEGER,
        oliMesinFile TEXT,
        airRadiator INTEGER,
        airRadiatorFile TEXT,
        airWiper INTEGER,
        airWiperFile TEXT,
        sabukPengaman INTEGER,
        sabukPengamanFile TEXT,
        stirKlakson INTEGER,
        stirKlaksonFile TEXT,
        dimGPSdanRFID INTEGER,
        dimGPSdanRFIDFile TEXT,
        panelInstrumendanKontrol INTEGER,
        panelInstrumendanKontrolFile TEXT,
        pedalGasRemKopling INTEGER,
        pedalGasRemKoplingFile TEXT,
        penempatanBarangLepasan INTEGER,
        penempatanBarangLepasanFile TEXT,
        lisensiDanIzinMengemudi INTEGER,
        lisensiDanIzinMengemudiFile TEXT,
        suratKendaraan INTEGER,
        suratKendaraanFile TEXT,
        jmpfmc INTEGER,
        jmpfmcFile TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE $_tblInspectionWeek (
        id INTEGER PRIMARY KEY,
        inspectionId INTEGER,
        minyakRem INTEGER,
        minyakRemFile TEXT,
        minyakPowerSteering INTEGER,
        minyakPowerSteeringFile TEXT,
        vBelt INTEGER,
        vBeltFile TEXT,
        bateraiAki INTEGER,
        bateraiAkiFile TEXT,
        remParkir INTEGER,
        remParkirFile TEXT,
        sandaranKepalaJok INTEGER,
        sandaranKepalaJokFile TEXT,
        spion INTEGER,
        spionFile TEXT,
        bagianBawahMesindanTransmisi INTEGER,
        bagianBawahMesindanTransmisiFile TEXT,
        banCadanganDongrakKunci INTEGER,
        banCadanganDongrakKunciFile TEXT,
        alatPemadamApiRingan INTEGER,
        alatPemadamApiRinganFile TEXT,
        itemP3K INTEGER,
        itemP3KFile TEXT,
        segitigaReflektif INTEGER,
        segitigaReflektifFile TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE $_tblInspectionMonth (
        id INTEGER PRIMARY KEY,
        inspectionId INTEGER,
        kinerjaRem INTEGER,
        kinerjaRemFile TEXT,
        kinerjaMesin INTEGER,
        kinerjaMesinFile TEXT,
        transmisi4WD INTEGER,
        transmisi4WDFile TEXT,
        sekering INTEGER,
        sekeringFile TEXT,
        bagianBawahKendaraan INTEGER,
        bagianBawahKendaraanFile TEXT
      );
    ''');
  }

  Future<void> resetDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/inspection.db';

    databaseFactory.deleteDatabase(databasePath);

    _database = await _initDb();
  }

  /* 
   * Operations
   */

  Future<Map<String, dynamic>?> getById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblInspection,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await database;
    final results = await db!.query(
      _tblInspection,
    );

    return results;
  }

  Future<List<Map<String, dynamic>>> getAllDay() async {
    final db = await database;
    final results = await db!.query(
      _tblInspectionDay,
    );

    return results;
  }

  Future<List<Map<String, dynamic>>> getAllWeek() async {
    final db = await database;
    final results = await db!.query(
      _tblInspectionWeek,
    );

    return results;
  }

  Future<List<Map<String, dynamic>>> getAllMonth() async {
    final db = await database;
    final results = await db!.query(
      _tblInspectionMonth,
    );

    return results;
  }

  Future<int> insert(InspectionModel inspectionModel) async {
    final db = await database;
    return await db!.insert(_tblInspection, inspectionModel.toJson());
  }

  Future<int> insertDay(InspectionDayModel inspectionDayModel) async {
    final db = await database;
    return await db!.insert(_tblInspectionDay, inspectionDayModel.toJson());
  }

  Future<int> insertWeek(InspectionWeekModel inspectionWeekModel) async {
    final db = await database;
    return await db!.insert(_tblInspectionWeek, inspectionWeekModel.toJson());
  }

  Future<int> insertMonth(InspectionMonthModel inspectionMonthModel) async {
    final db = await database;
    return await db!.insert(_tblInspectionMonth, inspectionMonthModel.toJson());
  }

  Future<int> update(InspectionModel inspectionModel) async {
    final db = await database;
    return await db!.update(
      _tblInspection,
      inspectionModel.toJson(),
      where: 'id = ?',
      whereArgs: [inspectionModel.id],
    );
  }

  Future<int> remove(InspectionModel inspectionModel) async {
    final db = await database;
    return await db!.delete(
      _tblInspection,
      where: 'id = ?',
      whereArgs: [inspectionModel.id],
    );
  }

  /*
  * Checking Id
  */

  Future<bool> checkInspectionId(int id) async {
    final db = await database;
    final result = await db!.query(
      _tblInspection,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.length == 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkInspectionDayId(int id) async {
    final db = await database;
    final result = await db!.query(
      _tblInspectionDay,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.length == 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkInspectionWeekId(int id) async {
    final db = await database;
    final result = await db!.query(
      _tblInspectionWeek,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.length == 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkInspectionMonthId(int id) async {
    final db = await database;
    final result = await db!.query(
      _tblInspectionMonth,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.length == 1) {
      return true;
    } else {
      return false;
    }
  }
}
