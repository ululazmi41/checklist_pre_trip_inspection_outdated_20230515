import 'package:json_annotation/json_annotation.dart';
import 'package:main/data/models/entity/inspection_week_entity.dart';

part 'inspection_week_model.g.dart';

@JsonSerializable()
class InspectionWeekModel extends InspectionWeekEquatable {
  const InspectionWeekModel({
    required int id,
    required int inspectionId,

    // BAGIAN MESIN
    required int minyakRem,
    required String? minyakRemFile,
    required int minyakPowerSteering,
    required String? minyakPowerSteeringFile,
    required int vBelt,
    required String? vBeltFile,
    required int bateraiAki,
    required String? bateraiAkiFile,

    // DALAM KABIN & LUAR KENDARAAN
    required int remParkir,
    required String? remParkirFile,
    required int sandaranKepalaJok,
    required String? sandaranKepalaJokFile,
    required int spion,
    required String? spionFile,
    required int bagianBawahMesindanTransmisi,
    required String? bagianBawahMesindanTransmisiFile,
    required int banCadanganDongrakKunci,
    required String? banCadanganDongrakKunciFile,
    required int alatPemadamApiRingan,
    required String? alatPemadamApiRinganFile,
    required int itemP3K,
    required String? itemP3KFile,
    required int segitigaReflektif,
    required String? segitigaReflektifFile,
  }) : super(
          id: id,
          inspectionId: inspectionId,

          // BAGIAN MESIN
          minyakRem: minyakRem,
          minyakRemFile: minyakRemFile,
          minyakPowerSteering: minyakPowerSteering,
          minyakPowerSteeringFile: minyakPowerSteeringFile,
          vBelt: vBelt,
          vBeltFile: vBeltFile,
          bateraiAki: bateraiAki,
          bateraiAkiFile: bateraiAkiFile,

          // DALAM KABIN & LUAR KENDARAAN
          remParkir: remParkir,
          remParkirFile: remParkirFile,
          sandaranKepalaJok: sandaranKepalaJok,
          sandaranKepalaJokFile: sandaranKepalaJokFile,
          spion: spion,
          spionFile: spionFile,
          bagianBawahMesindanTransmisi: bagianBawahMesindanTransmisi,
          bagianBawahMesindanTransmisiFile: bagianBawahMesindanTransmisiFile,
          banCadanganDongrakKunci: banCadanganDongrakKunci,
          banCadanganDongrakKunciFile: banCadanganDongrakKunciFile,
          alatPemadamApiRingan: alatPemadamApiRingan,
          alatPemadamApiRinganFile: alatPemadamApiRinganFile,
          itemP3K: itemP3K,
          itemP3KFile: itemP3KFile,
          segitigaReflektif: segitigaReflektif,
          segitigaReflektifFile: segitigaReflektifFile,
        );

  factory InspectionWeekModel.fromJson(Map<String, dynamic> json) {
    return _$InspectionWeekModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InspectionWeekModelToJson(this);
}
