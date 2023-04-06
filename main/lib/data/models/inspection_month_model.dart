import 'package:json_annotation/json_annotation.dart';
import 'package:main/data/models/entity/inspection_month_entity.dart';

part 'inspection_month_model.g.dart';

@JsonSerializable()
class InspectionMonthModel extends InspectionMonthEquatable {
  const InspectionMonthModel({
    required int id,
    required int inspectionId,

    // UJI FUNGSI
    required int kinerjaRem,
    required String? kinerjaRemFile,
    required int kinerjaMesin,
    required String? kinerjaMesinFile,
    required int transmisi4WD,
    required String? transmisi4WDFile,

    // CEK VISUAL
    required int sekering,
    required String? sekeringFile,
    required int bagianBawahKendaraan,
    required String? bagianBawahKendaraanFile,
  }) : super(
          id: id,
          inspectionId: inspectionId,

          // UJI FUNGSI
          kinerjaRem: kinerjaRem,
          kinerjaRemFile: kinerjaRemFile,
          kinerjaMesin: kinerjaMesin,
          kinerjaMesinFile: kinerjaMesinFile,
          transmisi4WD: transmisi4WD,
          transmisi4WDFile: transmisi4WDFile,

          // CEK VISUAL
          sekering: sekering,
          sekeringFile: sekeringFile,
          bagianBawahKendaraan: bagianBawahKendaraan,
          bagianBawahKendaraanFile: bagianBawahKendaraanFile,
        );

  factory InspectionMonthModel.fromJson(Map<String, dynamic> json) {
    return _$InspectionMonthModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InspectionMonthModelToJson(this);
}
