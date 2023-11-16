import 'dart:convert';

class KhsModel {
  final String? message;
  final List<Semester>? semesters;
  final List<IndeksPrestasi> indeksPrestasis;

  KhsModel({
    this.message,
    this.semesters,
    required this.indeksPrestasis,
  });

  factory KhsModel.fromRawJson(String str) =>
      KhsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory KhsModel.fromJson(Map<String, dynamic> json) => KhsModel(
        message: json["message"],
        semesters: json["semesters"] == null
            ? []
            : List<Semester>.from(
                json["semesters"]!.map((x) => Semester.fromJson(x))),
        indeksPrestasis: json["indeks_prestasis"] == null
            ? []
            : List<IndeksPrestasi>.from(json["indeks_prestasis"]!
                .map((x) => IndeksPrestasi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "semesters": semesters == null
            ? []
            : List<dynamic>.from(semesters!.map((x) => x.toJson())),
        "indeks_prestasis": indeksPrestasis == null
            ? []
            : List<dynamic>.from(indeksPrestasis!.map((x) => x.toJson())),
      };
}

class IndeksPrestasi {
  final int? id;
  final int? idMahasiswa;
  final String? nim;
  final int? idSemester;
  final int? tahun;
  final int? semesterTahunAjaran;
  final String? indeksPrestasiSemester;
  final String? indeksPrestasiKumulatif;
  final int? isGtakademik;
  final dynamic updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? jumlahSks;

  IndeksPrestasi({
    this.id,
    this.idMahasiswa,
    this.nim,
    this.idSemester,
    this.tahun,
    this.semesterTahunAjaran,
    this.indeksPrestasiSemester,
    this.indeksPrestasiKumulatif,
    this.isGtakademik,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.jumlahSks,
  });

  factory IndeksPrestasi.fromRawJson(String str) =>
      IndeksPrestasi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IndeksPrestasi.fromJson(Map<String, dynamic> json) => IndeksPrestasi(
        id: json["id"],
        idMahasiswa: json["id_mahasiswa"],
        nim: json["nim"]!,
        idSemester: json["id_semester"],
        tahun: json["tahun"],
        semesterTahunAjaran: json["semester_tahun_ajaran"],
        indeksPrestasiSemester: json["indeks_prestasi_semester"] ?? '',
        indeksPrestasiKumulatif: json["indeks_prestasi_kumulatif"],
        isGtakademik: json["is_gtakademik"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        jumlahSks: json["jumlah_sks"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_mahasiswa": idMahasiswa,
        "nim": nim,
        "id_semester": idSemester,
        "tahun": tahun,
        "semester_tahun_ajaran": semesterTahunAjaran,
        "indeks_prestasi_semester": indeksPrestasiSemester,
        "indeks_prestasi_kumulatif": indeksPrestasiKumulatif,
        "is_gtakademik": isGtakademik,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "jumlah_sks": jumlahSks,
      };
}

class Semester {
  final dynamic deletedAt;
  final int? id;
  final int? tahun;
  final String? kode;
  final Jenis? jenis;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? isActive;
  final String? tahunAjaran;
  final int? updatedBy;

  Semester({
    this.deletedAt,
    this.id,
    this.tahun,
    this.kode,
    this.jenis,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.tahunAjaran,
    this.updatedBy,
  });

  factory Semester.fromRawJson(String str) =>
      Semester.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        deletedAt: json["deleted_at"],
        id: json["id"],
        tahun: json["tahun"],
        kode: json["kode"],
        jenis: jenisValues.map[json["jenis"]]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        tahunAjaran: json["tahun_ajaran"],
        updatedBy: json["updated_by"],
      );

  Map<String, dynamic> toJson() => {
        "deleted_at": deletedAt,
        "id": id,
        "tahun": tahun,
        "kode": kode,
        "jenis": jenisValues.reverse[jenis],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_active": isActive,
        "tahun_ajaran": tahunAjaran,
        "updated_by": updatedBy,
      };
}

enum Jenis { GANJIL, GENAP }

final jenisValues = EnumValues({"ganjil": Jenis.GANJIL, "genap": Jenis.GENAP});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
