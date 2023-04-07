import 'dart:developer';

import 'package:core/core.dart';
import 'package:main/data/datasources/db/database_helper.dart';
import 'package:main/data/models/inspection_day_model.dart';
import 'package:main/data/models/inspection_model.dart';
import 'package:main/data/models/inspection_month_model.dart';
import 'package:main/data/models/inspection_week_model.dart';

abstract class LocalDataSource {
  Future<InspectionModel?> getInspectionById(int id);
  Future<List<InspectionModel>> getAllInspection();
  Future<List<InspectionDayModel>> getAllDayInspection(); // TODO: remove?
  Future<List<InspectionWeekModel>> getAllWeekInspection(); // TODO: remove?
  Future<List<InspectionMonthModel>> getAllMonthInspection(); // TODO: remove?
  Future<bool> insertInspection(InspectionModel inspectionModel);
  Future<bool> insertDayInspection(InspectionDayModel inspectionDayModel);
  Future<bool> insertWeekInspection(InspectionWeekModel inspectionWeekModel);
  Future<bool> insertMonthInspection(InspectionMonthModel inspectionMonthModel);
  Future<bool> updateInspection(InspectionModel inspectionModel);
  Future<bool> removeInspection(InspectionModel inspectionModel);

  Future<bool> checkInspectionId(int id);
  Future<bool> checkInspectionDayId(int id);
  Future<bool> checkInspectionWeekId(int id);
  Future<bool> checkInspectionMonthId(int id);

  Future<void> resetDatabase();
}

class LocalDataSourceImpl extends LocalDataSource {
  final DatabaseHelper databaseHelper;

  LocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<void> resetDatabase() async {
    try {
      await databaseHelper.resetDatabase();
    } catch (e) {
      rethrow; // TODO: Better and more proper error handling
    }
  }

  @override
  Future<InspectionModel?> getInspectionById(int id) async {
    try {
      final result = await databaseHelper.getById(id);
      if (result != null) {
        return InspectionModel.fromJson(result);
      } else {
        return null;
      }
    } catch (e) {
      throw DatabaseException("Failed to get the inspection data");
    } // TODO: unnecessary try catch, throw instead of returning null
  }

  @override
  Future<List<InspectionModel>> getAllInspection() async {
    try {
      final result = await databaseHelper.getAll();
      if (result.isNotEmpty) {
        return result.map((data) => InspectionModel.fromJson(data)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw DatabaseException("Failed to get all the inspection data");
    }
  }

  @override
  Future<List<InspectionDayModel>> getAllDayInspection() async {
    try {
      final result = await databaseHelper.getAllDay();
      if (result.isNotEmpty) {
        return result.map((data) => InspectionDayModel.fromJson(data)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw DatabaseException("Failed to get all the day inspection data");
    }
  } // TODO: rmeove?

  @override
  Future<List<InspectionWeekModel>> getAllWeekInspection() async {
    try {
      final result = await databaseHelper.getAllWeek();
      if (result.isNotEmpty) {
        return result
            .map((data) => InspectionWeekModel.fromJson(data))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw DatabaseException("Failed to get all the week inspection data");
    }
  } // TODO: rmeove?

  @override
  Future<List<InspectionMonthModel>> getAllMonthInspection() async {
    try {
      final result = await databaseHelper.getAllMonth();
      if (result.isNotEmpty) {
        return result
            .map((data) => InspectionMonthModel.fromJson(data))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      throw DatabaseException("Failed to get all the month inspection data");
    }
  } // TODO: rmeove?

  @override
  Future<bool> insertInspection(InspectionModel inspectionModel) async {
    try {
      final result = await databaseHelper.insert(inspectionModel);
      log("insert inspection: $result"); // TODO: Remove log
      return true; // TODO 1: Proper return value
    } catch (e) {
      return false; // TODO 1: Proper return value
      // TODO: Proper error handling
    }
  } // TODO:

  @override
  Future<bool> insertDayInspection(
      InspectionDayModel inspectionDayModel) async {
    try {
      final result = await databaseHelper.insertDay(inspectionDayModel);
      log("insert inspection day: $result");
      return true;
    } catch (e) {
      return false;
    }
  } // TODO:

  @override
  Future<bool> insertWeekInspection(
      InspectionWeekModel inspectionWeekModel) async {
    try {
      await databaseHelper.insertWeek(inspectionWeekModel);
      return true;
    } catch (e) {
      return false;
    }
  } // TODO:

  @override
  Future<bool> insertMonthInspection(
      InspectionMonthModel inspectionMonthModel) async {
    try {
      await databaseHelper.insertMonth(inspectionMonthModel);
      return true;
    } catch (e) {
      return false;
    }
  } // TODO:

  @override
  Future<bool> removeInspection(InspectionModel inspectionModel) async {
    try {
      await databaseHelper.remove(inspectionModel);
      return true;
    } catch (e) {
      return false;
    }
  } // TODO:

  @override
  Future<bool> updateInspection(InspectionModel inspectionModel) async {
    try {
      final result = await databaseHelper.update(inspectionModel);
      log("inspection update result: $result");
      return true;
    } catch (e) {
      return false;
    }
  } // TODO:

  /*
  * Checking Id
  */

  @override
  Future<bool> checkInspectionId(int id) async {
    return await databaseHelper.checkInspectionId(id);
  }

  @override
  Future<bool> checkInspectionDayId(int id) async {
    return await databaseHelper.checkInspectionDayId(id);
  }

  @override
  Future<bool> checkInspectionWeekId(int id) async {
    return await databaseHelper.checkInspectionWeekId(id);
  }

  @override
  Future<bool> checkInspectionMonthId(int id) async {
    return await databaseHelper.checkInspectionMonthId(id);
  }
}
