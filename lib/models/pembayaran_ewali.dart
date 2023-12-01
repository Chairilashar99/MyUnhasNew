// import 'dart:convert';

// class PembayaranModel {
//   final Pembayaran pembayaran;
//   final String status;

//   PembayaranModel({
//     required this.pembayaran,
//     required this.status,
//   });

//   factory PembayaranModel.fromRawJson(String str) =>
//       PembayaranModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory PembayaranModel.fromJson(Map<String, dynamic> json) =>
//       PembayaranModel(
//         pembayaran: Pembayaran.fromJson(json["pembayaran"]),
//         status: json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "pembayaran": pembayaran.toJson(),
//         "status": status,
//       };
// }

// class Pembayaran {
//   final int id;
//   final int idMahasiswa;
//   final int idSemester;
//   final int sudahBayar;
//   final dynamic updatedBy;
//   final int isManual;
//   final dynamic bank;
//   final dynamic nominal;
//   final dynamic sumberBiaya;
//   final Semester semester;

//   Pembayaran({
//     required this.id,
//     required this.idMahasiswa,
//     required this.idSemester,
//     required this.sudahBayar,
//     required this.updatedBy,
//     required this.isManual,
//     required this.bank,
//     required this.nominal,
//     required this.sumberBiaya,
//     required this.semester,
//   });

//   factory Pembayaran.fromRawJson(String str) =>
//       Pembayaran.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Pembayaran.fromJson(Map<String, dynamic> json) => Pembayaran(
//         id: json["id"],
//         idMahasiswa: json["id_mahasiswa"],
//         idSemester: json["id_semester"],
//         sudahBayar: json["sudah_bayar"],
//         updatedBy: json["updated_by"],
//         isManual: json["is_manual"],
//         bank: json["bank"],
//         nominal: json["nominal"],
//         sumberBiaya: json["sumber_biaya"],
//         semester: Semester.fromJson(json["semester"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "id_mahasiswa": idMahasiswa,
//         "id_semester": idSemester,
//         "sudah_bayar": sudahBayar,
//         "updated_by": updatedBy,
//         "is_manual": isManual,
//         "bank": bank,
//         "nominal": nominal,
//         "sumber_biaya": sumberBiaya,
//         "semester": semester.toJson(),
//       };
// }

// class Semester {
//   final dynamic deletedAt;
//   final int id;
//   final int tahun;
//   final String kode;
//   final String jenis;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int isActive;
//   final String tahunAjaran;
//   final int updatedBy;

//   Semester({
//     required this.deletedAt,
//     required this.id,
//     required this.tahun,
//     required this.kode,
//     required this.jenis,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.isActive,
//     required this.tahunAjaran,
//     required this.updatedBy,
//   });

//   factory Semester.fromRawJson(String str) =>
//       Semester.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Semester.fromJson(Map<String, dynamic> json) => Semester(
//         deletedAt: json["deleted_at"],
//         id: json["id"],
//         tahun: json["tahun"],
//         kode: json["kode"],
//         jenis: json["jenis"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         isActive: json["is_active"],
//         tahunAjaran: json["tahun_ajaran"],
//         updatedBy: json["updated_by"],
//       );

//   Map<String, dynamic> toJson() => {
//         "deleted_at": deletedAt,
//         "id": id,
//         "tahun": tahun,
//         "kode": kode,
//         "jenis": jenis,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "is_active": isActive,
//         "tahun_ajaran": tahunAjaran,
//         "updated_by": updatedBy,
//       };
// }

import 'dart:convert';

class PembayaranModel {
  final Pembayaran pembayaran;
  final String status;

  PembayaranModel({
    required this.pembayaran,
    required this.status,
  });

  factory PembayaranModel.fromRawJson(String str) =>
      PembayaranModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PembayaranModel.fromJson(Map<String, dynamic> json) =>
      PembayaranModel(
        pembayaran: Pembayaran.fromJson(json["pembayaran"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "pembayaran": pembayaran.toJson(),
        "status": status,
      };
}

class Pembayaran {
  final int id;
  final int idMahasiswa;
  final int idSemester;
  final int sudahBayar;
  final dynamic updatedBy;
  final int isManual;
  final dynamic bank;
  final int nominal;
  final dynamic sumberBiaya;

  Pembayaran({
    required this.id,
    required this.idMahasiswa,
    required this.idSemester,
    required this.sudahBayar,
    required this.updatedBy,
    required this.isManual,
    required this.bank,
    required this.nominal,
    required this.sumberBiaya,
  });

  factory Pembayaran.fromRawJson(String str) =>
      Pembayaran.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pembayaran.fromJson(Map<String, dynamic> json) => Pembayaran(
        id: json["id"],
        idMahasiswa: json["id_mahasiswa"],
        idSemester: json["id_semester"],
        sudahBayar: json["sudah_bayar"],
        updatedBy: json["updated_by"],
        isManual: json["is_manual"],
        bank: json["bank"],
        nominal: json["nominal"],
        sumberBiaya: json["sumber_biaya"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_mahasiswa": idMahasiswa,
        "id_semester": idSemester,
        "sudah_bayar": sudahBayar,
        "updated_by": updatedBy,
        "is_manual": isManual,
        "bank": bank,
        "nominal": nominal,
        "sumber_biaya": sumberBiaya,
      };
}
