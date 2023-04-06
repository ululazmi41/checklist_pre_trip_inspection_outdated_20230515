import 'package:equatable/equatable.dart';

class InspectionMonthEquatable extends Equatable {
  const InspectionMonthEquatable({
    required this.id,
    required this.inspectionId,

    // UJI FUNGSI
    required this.kinerjaRem,
    required this.kinerjaRemFile,
    required this.kinerjaMesin,
    required this.kinerjaMesinFile,
    required this.transmisi4WD,
    required this.transmisi4WDFile,

    // CEK VISUAL
    required this.sekering,
    required this.sekeringFile,
    required this.bagianBawahKendaraan,
    required this.bagianBawahKendaraanFile,
  });

  final int id;
  final int inspectionId;

  // UJI FUNGSI
  final int kinerjaRem;
  final String? kinerjaRemFile;
  final int kinerjaMesin;
  final String? kinerjaMesinFile;
  final int transmisi4WD;
  final String? transmisi4WDFile;

  // CEK VISUAL
  final int sekering;
  final String? sekeringFile;
  final int bagianBawahKendaraan;
  final String? bagianBawahKendaraanFile;

  @override
  List<Object?> get props => [
        // UJI FUNGSI
        kinerjaRem,
        kinerjaRemFile,
        kinerjaMesin,
        kinerjaMesinFile,
        transmisi4WD,
        transmisi4WDFile,

        // CEK VISUAL
        sekering,
        sekeringFile,
        bagianBawahKendaraan,
        bagianBawahKendaraanFile,
      ];
}
