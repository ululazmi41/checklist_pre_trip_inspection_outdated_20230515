import 'package:json_annotation/json_annotation.dart';
import 'package:main/data/models/entity/inspection_day_entity.dart';

part 'inspection_day_model.g.dart';

@JsonSerializable()
class InspectionDayModel extends InspectionDayEquatable {
  const InspectionDayModel({
    required int id,
    required int inspectionId,

    // LUAR KENDARAAN
    required int kacaDepanWiper,
    required String? kacaDepanWiperFile,
    required int bodiKacaJendelaKacaBelakang,
    required String? bodiKacaJendelaKacaBelakangFile,
    required int ban,
    required String? banFile,
    required int lampu,
    required String? lampuFile,
    required int pengamananBarangMuatan,
    required String? pengamananBarangMuatanFile,

    // BAGIAN MESIN
    required int oliMesin,
    required String? oliMesinFile,
    required int airRadiator,
    required String? airRadiatorFile,
    required int airWiper,
    required String? airWiperFile,

    // DALAM KABIN
    required int sabukPengaman,
    required String? sabukPengamanFile,
    required int stirKlakson,
    required String? stirKlaksonFile,
    required int dimGPSdanRFID,
    required String? dimGPSdanRFIDFile,
    required int panelInstrumendanKontrol,
    required String? panelInstrumendanKontrolFile,
    required int pedalGasRemKopling,
    required String? pedalGasRemKoplingFile,
    required int penempatanBarangLepasan,
    required String? penempatanBarangLepasanFile,

    // Dokumen
    required int lisensiDanIzinMengemudi,
    required String? lisensiDanIzinMengemudiFile,
    required int suratKendaraan,
    required String? suratKendaraanFile,
    required int jmpfmc,
    required String? jmpfmcFile,
  }) : super(
          id: id,
          inspectionId: inspectionId,

          // LUAR KENDARAAN
          kacaDepanWiper: kacaDepanWiper,
          kacaDepanWiperFile: kacaDepanWiperFile,
          bodiKacaJendelaKacaBelakang: bodiKacaJendelaKacaBelakang,
          bodiKacaJendelaKacaBelakangFile: bodiKacaJendelaKacaBelakangFile,
          ban: ban,
          banFile: banFile,
          lampu: lampu,
          lampuFile: lampuFile,
          pengamananBarangMuatan: pengamananBarangMuatan,
          pengamananBarangMuatanFile: pengamananBarangMuatanFile,

          // BAGIAN MESIN
          oliMesin: oliMesin,
          oliMesinFile: oliMesinFile,
          airRadiator: airRadiator,
          airRadiatorFile: airRadiatorFile,
          airWiper: airWiper,
          airWiperFile: airWiperFile,

          // DALAM KABIN
          sabukPengaman: sabukPengaman,
          sabukPengamanFile: sabukPengamanFile,
          stirKlakson: stirKlakson,
          stirKlaksonFile: stirKlaksonFile,
          dimGPSdanRFID: dimGPSdanRFID,
          dimGPSdanRFIDFile: dimGPSdanRFIDFile,
          panelInstrumendanKontrol: panelInstrumendanKontrol,
          panelInstrumendanKontrolFile: panelInstrumendanKontrolFile,
          pedalGasRemKopling: pedalGasRemKopling,
          pedalGasRemKoplingFile: pedalGasRemKoplingFile,
          penempatanBarangLepasan: penempatanBarangLepasan,
          penempatanBarangLepasanFile: penempatanBarangLepasanFile,

          // Dokumen
          lisensiDanIzinMengemudi: lisensiDanIzinMengemudi,
          lisensiDanIzinMengemudiFile: lisensiDanIzinMengemudiFile,
          suratKendaraan: suratKendaraan,
          suratKendaraanFile: suratKendaraanFile,
          jmpfmc: jmpfmc,
          jmpfmcFile: jmpfmcFile,
        );

  factory InspectionDayModel.fromJson(Map<String, dynamic> json) {
    return _$InspectionDayModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InspectionDayModelToJson(this);
}
