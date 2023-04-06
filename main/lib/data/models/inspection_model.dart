import 'package:json_annotation/json_annotation.dart';
import 'package:main/data/models/entity/inspection_entity.dart';

part 'inspection_model.g.dart';

@JsonSerializable()
class InspectionModel extends InspectionEquatable {
  const InspectionModel({
    required int id,
    required String nomorPlat,
    required String tipeKendaraan,
    required String perusahaan,
    required String tanggal,
    required String lokasi,
    required String inspeksiHarian,
    required String inspeksiMingguan,
    required String inspeksiBulanan,
  }) : super(
          id: id,
          nomorPlat: nomorPlat,
          tipeKendaraan: tipeKendaraan,
          perusahaan: perusahaan,
          tanggal: tanggal,
          lokasi: lokasi,
          inspeksiHarian: inspeksiHarian,
          inspeksiMingguan: inspeksiMingguan,
          inspeksiBulanan: inspeksiBulanan,
        );

  factory InspectionModel.fromEquatable(
      InspectionEquatable inspectionEquatable) {
    return InspectionModel(
      id: inspectionEquatable.id,
      nomorPlat: inspectionEquatable.nomorPlat,
      tipeKendaraan: inspectionEquatable.tipeKendaraan,
      perusahaan: inspectionEquatable.perusahaan,
      tanggal: inspectionEquatable.tanggal,
      lokasi: inspectionEquatable.lokasi,
      inspeksiHarian: inspectionEquatable.inspeksiHarian,
      inspeksiMingguan: inspectionEquatable.inspeksiMingguan,
      inspeksiBulanan: inspectionEquatable.inspeksiBulanan,
    );
  }

  factory InspectionModel.fromJson(Map<String, dynamic> json) {
    return _$InspectionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InspectionModelToJson(this);
}
