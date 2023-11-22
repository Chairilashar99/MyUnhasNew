import 'dart:convert';

class SemesterModel {
  final List<Semester> semesters;

  SemesterModel({
    required this.semesters,
  });

  factory SemesterModel.fromRawJson(String str) =>
      SemesterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SemesterModel.fromJson(Map<String, dynamic> json) => SemesterModel(
        semesters: List<Semester>.from(
            json["semesters"].map((x) => Semester.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "semesters": List<dynamic>.from(semesters.map((x) => x.toJson())),
      };
}

class Semester {
  // final dynamic deletedAt;
  final int id;
  final int tahun;
  final String kode;
  final Jenis jenis;
  // final DateTime createdAt;
  final DateTime updatedAt;
  final int isActive;
  final String tahunAjaran;
  // final int updatedBy;

  Semester({
    // required this.deletedAt,
    required this.id,
    required this.tahun,
    required this.kode,
    required this.jenis,
    // required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.tahunAjaran,
    // required this.updatedBy,
  });

  factory Semester.fromRawJson(String str) =>
      Semester.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        // deletedAt: json["deleted_at"],
        id: json["id"],
        tahun: json["tahun"],
        kode: json["kode"],
        jenis: jenisValues.map[json["jenis"]]!,
        // createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        tahunAjaran: json["tahun_ajaran"],
        // updatedBy: json["updated_by"],
      );

  Map<String, dynamic> toJson() => {
        // "deleted_at": deletedAt,
        "id": id,
        "tahun": tahun,
        "kode": kode,
        "jenis": jenisValues.reverse[jenis],
        // "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "tahun_ajaran": tahunAjaran,
        // "updated_by": updatedBy,
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
