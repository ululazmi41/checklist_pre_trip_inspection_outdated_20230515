import 'package:equatable/equatable.dart';

class InspectionEquatable extends Equatable {
  const InspectionEquatable({
    required this.id,
    required this.nomorPlat,
    required this.tipeKendaraan,
    required this.perusahaan,
    required this.tanggal,
    required this.lokasi,
    required this.inspeksiHarian,
    required this.inspeksiMingguan,
    required this.inspeksiBulanan,
  });

  final int id;

  // Data
  final String nomorPlat;
  final String tipeKendaraan;
  final String perusahaan;
  final String tanggal;
  final String lokasi;

  // Inspeksi
  final String inspeksiHarian;
  final String inspeksiMingguan;
  final String inspeksiBulanan;

  @override
  List<Object?> get props => [
        nomorPlat,
        tipeKendaraan,
        perusahaan,
        tanggal,
        lokasi,
        inspeksiHarian,
        inspeksiMingguan,
        inspeksiBulanan,
      ];

  InspectionEquatable copyWith({
    int? id,
    String? nomorPlat,
    String? tipeKendaraan,
    String? perusahaan,
    String? tanggal, // TODO: DateTime
    String? lokasi,
    String? inspeksiHarian,
    String? inspeksiMingguan,
    String? inspeksiBulanan,
  }) {
    return InspectionEquatable(
      id: id ?? this.id,
      nomorPlat: nomorPlat ?? this.nomorPlat,
      tipeKendaraan: tipeKendaraan ?? this.tipeKendaraan,
      perusahaan: perusahaan ?? this.perusahaan,
      tanggal: tanggal ?? this.tanggal,
      lokasi: lokasi ?? this.lokasi,
      inspeksiHarian: inspeksiHarian ?? this.inspeksiHarian,
      inspeksiMingguan: inspeksiMingguan ?? this.inspeksiMingguan,
      inspeksiBulanan: inspeksiBulanan ?? this.inspeksiBulanan,
    );
  }
}
