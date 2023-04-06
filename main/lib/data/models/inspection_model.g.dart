// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionModel _$InspectionModelFromJson(Map<String, dynamic> json) =>
    InspectionModel(
      id: json['id'] as int,
      nomorPlat: json['nomorPlat'] as String,
      tipeKendaraan: json['tipeKendaraan'] as String,
      perusahaan: json['perusahaan'] as String,
      tanggal: json['tanggal'] as String,
      lokasi: json['lokasi'] as String,
      inspeksiHarian: json['inspeksiHarian'] as String,
      inspeksiMingguan: json['inspeksiMingguan'] as String,
      inspeksiBulanan: json['inspeksiBulanan'] as String,
    );

Map<String, dynamic> _$InspectionModelToJson(InspectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomorPlat': instance.nomorPlat,
      'tipeKendaraan': instance.tipeKendaraan,
      'perusahaan': instance.perusahaan,
      'tanggal': instance.tanggal,
      'lokasi': instance.lokasi,
      'inspeksiHarian': instance.inspeksiHarian,
      'inspeksiMingguan': instance.inspeksiMingguan,
      'inspeksiBulanan': instance.inspeksiBulanan,
    };
