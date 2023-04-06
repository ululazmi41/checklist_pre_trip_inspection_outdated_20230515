import 'package:equatable/equatable.dart';

class InspectionDayEquatable extends Equatable {
  const InspectionDayEquatable({
    required this.id,
    required this.inspectionId,

    // LUAR KENDARAAN
    required this.kacaDepanWiper,
    required this.kacaDepanWiperFile,
    required this.bodiKacaJendelaKacaBelakang,
    required this.bodiKacaJendelaKacaBelakangFile,
    required this.ban,
    required this.banFile,
    required this.lampu,
    required this.lampuFile,
    required this.pengamananBarangMuatan,
    required this.pengamananBarangMuatanFile,

    // BAGIAN MESIN
    required this.oliMesin,
    required this.oliMesinFile,
    required this.airRadiator,
    required this.airRadiatorFile,
    required this.airWiper,
    required this.airWiperFile,

    // DALAM KABIN
    required this.sabukPengaman,
    required this.sabukPengamanFile,
    required this.stirKlakson,
    required this.stirKlaksonFile,
    required this.dimGPSdanRFID,
    required this.dimGPSdanRFIDFile,
    required this.panelInstrumendanKontrol,
    required this.panelInstrumendanKontrolFile,
    required this.pedalGasRemKopling,
    required this.pedalGasRemKoplingFile,
    required this.penempatanBarangLepasan,
    required this.penempatanBarangLepasanFile,

    // Dokumen
    required this.lisensiDanIzinMengemudi,
    required this.lisensiDanIzinMengemudiFile,
    required this.suratKendaraan,
    required this.suratKendaraanFile,
    required this.jmpfmc,
    required this.jmpfmcFile,
  });

  final int id;
  final int inspectionId;

  // LUAR KENDARAAN
  final int kacaDepanWiper;
  final String? kacaDepanWiperFile;
  final int bodiKacaJendelaKacaBelakang;
  final String? bodiKacaJendelaKacaBelakangFile;
  final int ban;
  final String? banFile;
  final int lampu;
  final String? lampuFile;
  final int pengamananBarangMuatan;
  final String? pengamananBarangMuatanFile;

  // BAGIAN MESIN
  final int oliMesin;
  final String? oliMesinFile;
  final int airRadiator;
  final String? airRadiatorFile;
  final int airWiper;
  final String? airWiperFile;

  // DALAM KABIN
  final int sabukPengaman;
  final String? sabukPengamanFile;
  final int stirKlakson;
  final String? stirKlaksonFile;
  final int dimGPSdanRFID;
  final String? dimGPSdanRFIDFile;
  final int panelInstrumendanKontrol;
  final String? panelInstrumendanKontrolFile;
  final int pedalGasRemKopling;
  final String? pedalGasRemKoplingFile;
  final int penempatanBarangLepasan;
  final String? penempatanBarangLepasanFile;

  // Dokumen
  final int lisensiDanIzinMengemudi;
  final String? lisensiDanIzinMengemudiFile;
  final int suratKendaraan;
  final String? suratKendaraanFile;
  final int jmpfmc;
  final String? jmpfmcFile;

  @override
  List<Object?> get props => [
        // LUAR KENDARAAN
        kacaDepanWiper,
        kacaDepanWiperFile,
        bodiKacaJendelaKacaBelakang,
        bodiKacaJendelaKacaBelakangFile,
        ban,
        banFile,
        lampu,
        lampuFile,
        pengamananBarangMuatan,
        pengamananBarangMuatanFile,

        // BAGIAN MESIN
        oliMesin,
        oliMesinFile,
        airRadiator,
        airRadiatorFile,
        airWiper,
        airWiperFile,

        // DALAM KABIN
        sabukPengaman,
        sabukPengamanFile,
        stirKlakson,
        stirKlaksonFile,
        dimGPSdanRFID,
        dimGPSdanRFIDFile,
        panelInstrumendanKontrol,
        panelInstrumendanKontrolFile,
        pedalGasRemKopling,
        pedalGasRemKoplingFile,
        penempatanBarangLepasan,
        penempatanBarangLepasanFile,

        // Dokumen
        lisensiDanIzinMengemudi,
        lisensiDanIzinMengemudiFile,
        suratKendaraan,
        suratKendaraanFile,
        jmpfmc,
        jmpfmcFile,
      ];
}
