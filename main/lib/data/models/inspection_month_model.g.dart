// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_month_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionMonthModel _$InspectionMonthModelFromJson(
        Map<String, dynamic> json) =>
    InspectionMonthModel(
      id: json['id'] as int,
      inspectionId: json['inspectionId'] as int,
      kinerjaRem: json['kinerjaRem'] as int,
      kinerjaRemFile: json['kinerjaRemFile'] as String?,
      kinerjaMesin: json['kinerjaMesin'] as int,
      kinerjaMesinFile: json['kinerjaMesinFile'] as String?,
      transmisi4WD: json['transmisi4WD'] as int,
      transmisi4WDFile: json['transmisi4WDFile'] as String?,
      sekering: json['sekering'] as int,
      sekeringFile: json['sekeringFile'] as String?,
      bagianBawahKendaraan: json['bagianBawahKendaraan'] as int,
      bagianBawahKendaraanFile: json['bagianBawahKendaraanFile'] as String?,
    );

Map<String, dynamic> _$InspectionMonthModelToJson(
        InspectionMonthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inspectionId': instance.inspectionId,
      'kinerjaRem': instance.kinerjaRem,
      'kinerjaRemFile': instance.kinerjaRemFile,
      'kinerjaMesin': instance.kinerjaMesin,
      'kinerjaMesinFile': instance.kinerjaMesinFile,
      'transmisi4WD': instance.transmisi4WD,
      'transmisi4WDFile': instance.transmisi4WDFile,
      'sekering': instance.sekering,
      'sekeringFile': instance.sekeringFile,
      'bagianBawahKendaraan': instance.bagianBawahKendaraan,
      'bagianBawahKendaraanFile': instance.bagianBawahKendaraanFile,
    };
