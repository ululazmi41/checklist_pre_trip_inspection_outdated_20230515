import 'package:main/data/models/inspection_day_model.dart';
import 'package:main/data/models/inspection_model.dart';
import 'package:main/data/models/inspection_month_model.dart';
import 'package:main/data/models/inspection_week_model.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

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
      password: "password",
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

    await db.execute('''
      CREATE TABLE $_tblInspectionDay (
        id INTEGER PRIMARY KEY,
        kacaDepanWiper INTEGER,
        bodiKacaJendelaKacaBelakang INTEGER,
        ban INTEGER,
        lampu INTEGER,
        pengamananBarangMuatan INTEGER,
        oliMesin INTEGER,
        airRadiator INTEGER,
        airWiper INTEGER,
        sabukPengaman INTEGER,
        stirKlakson INTEGER,
        dimGPSdanRFID INTEGER,
        panelInstrumendanKontrol INTEGER,
        pedalGasRemKopling INTEGER,
        penempatanBarangLepasan INTEGER,
        lisensiDanIzinMengemudi INTEGER,
        suratKendaraan INTEGER,
        jmpfmc INTEGER
      );
    ''');

    await db.execute('''
      CREATE TABLE $_tblInspectionWeek (
        id INTEGER PRIMARY KEY,
        minyakRem INTEGER,
        minyakPowerSteering INTEGER,
        vBelt INTEGER,
        bateraiAki INTEGER,
        remParkir INTEGER,
        sandaranKepalaJok INTEGER,
        spion INTEGER,
        bagianBawahMesindanTransmisi INTEGER,
        banCadanganDongrakKunci INTEGER,
        alatPemadamApiRingan INTEGER,
        itemP3K INTEGER,
        segitigaReflektif INTEGER
      );
    ''');

    await db.execute('''
      CREATE TABLE $_tblInspectionMonth (
        id INTEGER PRIMARY KEY,
        kinerjaRem BOOLEAN,
        kinerjaMesin BOOLEAN,
        transmisi4WD BOOLEAN,
        sekering BOOLEAN,
        bagianBawahKendaraan BOOLEAN
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
