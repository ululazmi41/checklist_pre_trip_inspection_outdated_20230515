import 'package:equatable/equatable.dart';

class InspectionWeekEquatable extends Equatable {
  const InspectionWeekEquatable({
    required this.id,
    required this.inspectionId,

    // BAGIAN MESIN
    required this.minyakRem,
    required this.minyakRemFile,
    required this.minyakPowerSteering,
    required this.minyakPowerSteeringFile,
    required this.vBelt,
    required this.vBeltFile,
    required this.bateraiAki,
    required this.bateraiAkiFile,

    // DALAM KABIN & LUAR KENDARAAN
    required this.remParkir,
    required this.remParkirFile,
    required this.sandaranKepalaJok,
    required this.sandaranKepalaJokFile,
    required this.spion,
    required this.spionFile,
    required this.bagianBawahMesindanTransmisi,
    required this.bagianBawahMesindanTransmisiFile,
    required this.banCadanganDongrakKunci,
    required this.banCadanganDongrakKunciFile,
    required this.alatPemadamApiRingan,
    required this.alatPemadamApiRinganFile,
    required this.itemP3K,
    required this.itemP3KFile,
    required this.segitigaReflektif,
    required this.segitigaReflektifFile,
  });

  final int id;
  final int inspectionId;

  // BAGIAN MESIN
  final int minyakRem;
  final String? minyakRemFile;
  final int minyakPowerSteering;
  final String? minyakPowerSteeringFile;
  final int vBelt;
  final String? vBeltFile;
  final int bateraiAki;
  final String? bateraiAkiFile;

  // DALAM KABIN & LUAR KENDARAAN
  final int remParkir;
  final String? remParkirFile;
  final int sandaranKepalaJok;
  final String? sandaranKepalaJokFile;
  final int spion;
  final String? spionFile;
  final int bagianBawahMesindanTransmisi;
  final String? bagianBawahMesindanTransmisiFile;
  final int banCadanganDongrakKunci;
  final String? banCadanganDongrakKunciFile;
  final int alatPemadamApiRingan;
  final String? alatPemadamApiRinganFile;
  final int itemP3K;
  final String? itemP3KFile;
  final int segitigaReflektif;
  final String? segitigaReflektifFile;

  @override
  List<Object?> get props => [
        minyakRem,
        minyakRemFile,
        minyakPowerSteering,
        minyakPowerSteeringFile,
        vBelt,
        vBeltFile,
        bateraiAki,
        bateraiAkiFile,

        // DALAM KABIN & LUAR KENDARAAN
        remParkir,
        remParkirFile,
        sandaranKepalaJok,
        sandaranKepalaJokFile,
        spion,
        spionFile,
        bagianBawahMesindanTransmisi,
        bagianBawahMesindanTransmisiFile,
        banCadanganDongrakKunci,
        banCadanganDongrakKunciFile,
        alatPemadamApiRingan,
        alatPemadamApiRinganFile,
        itemP3K,
        itemP3KFile,
        segitigaReflektif,
        segitigaReflektifFile,
      ];
}
