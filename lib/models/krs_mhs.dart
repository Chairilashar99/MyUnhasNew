import 'dart:convert';

class KrsModel {
  final String message;
  final KartuRencanaStudi kartuRencanaStudi;

  KrsModel({
    required this.message,
    required this.kartuRencanaStudi,
  });

  factory KrsModel.fromRawJson(String str) =>
      KrsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory KrsModel.fromJson(Map<String, dynamic> json) => KrsModel(
        message: json["message"],
        kartuRencanaStudi:
            KartuRencanaStudi.fromJson(json["kartu_rencana_studi"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "kartu_rencana_studi": kartuRencanaStudi.toJson(),
      };
}

class KartuRencanaStudi {
  final List<KelasKuliah> kelasKuliahs;

  KartuRencanaStudi({
    required this.kelasKuliahs,
  });

  factory KartuRencanaStudi.fromRawJson(String str) =>
      KartuRencanaStudi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory KartuRencanaStudi.fromJson(Map<String, dynamic> json) =>
      KartuRencanaStudi(
        kelasKuliahs: List<KelasKuliah>.from(
            json["kelas_kuliahs"].map((x) => KelasKuliah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kelas_kuliahs":
            List<dynamic>.from(kelasKuliahs.map((x) => x.toJson())),
      };
}

class KelasKuliah {
  final int id;
  final int idProdiSemester;
  final int idMataKuliah;
  final MataKuliah mataKuliah;
  final List<JadwalKuliah> jadwalKuliahs;

  KelasKuliah({
    required this.id,
    required this.idProdiSemester,
    required this.idMataKuliah,
    required this.mataKuliah,
    required this.jadwalKuliahs,
  });

  factory KelasKuliah.fromRawJson(String str) =>
      KelasKuliah.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory KelasKuliah.fromJson(Map<String, dynamic> json) => KelasKuliah(
        id: json["id"],
        idProdiSemester: json["id_prodi_semester"],
        idMataKuliah: json["id_mata_kuliah"],
        mataKuliah: MataKuliah.fromJson(json["mata_kuliah"]),
        jadwalKuliahs: List<JadwalKuliah>.from(
            json["jadwal_kuliahs"].map((x) => JadwalKuliah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_prodi_semester": idProdiSemester,
        "id_mata_kuliah": idMataKuliah,
        "mata_kuliah": mataKuliah.toJson(),
        "jadwal_kuliahs":
            List<dynamic>.from(jadwalKuliahs.map((x) => x.toJson())),
      };
}

class JadwalKuliah {
  final int id;
  final String startTime;
  final String endTime;
  final int idRuang;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int dayOfWeek;
  final int idKelasKuliah;
  final int updatedBy;
  final Ruang ruang;

  JadwalKuliah({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.idRuang,
    required this.createdAt,
    required this.updatedAt,
    required this.dayOfWeek,
    required this.idKelasKuliah,
    required this.updatedBy,
    required this.ruang,
  });

  factory JadwalKuliah.fromRawJson(String str) =>
      JadwalKuliah.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JadwalKuliah.fromJson(Map<String, dynamic> json) => JadwalKuliah(
        id: json["id"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        idRuang: json["id_ruang"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        dayOfWeek: json["day_of_week"],
        idKelasKuliah: json["id_kelas_kuliah"],
        updatedBy: json["updated_by"],
        ruang: Ruang.fromJson(json["ruang"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_time": startTime,
        "end_time": endTime,
        "id_ruang": idRuang,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "day_of_week": dayOfWeek,
        "id_kelas_kuliah": idKelasKuliah,
        "updated_by": updatedBy,
        "ruang": ruang.toJson(),
      };
}

class Ruang {
  final int id;
  final int idGedung;
  final int idGunaRuang;
  final String kode;
  final String nama;

  Ruang({
    required this.id,
    required this.idGedung,
    required this.idGunaRuang,
    required this.kode,
    required this.nama,
  });

  factory Ruang.fromRawJson(String str) => Ruang.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ruang.fromJson(Map<String, dynamic> json) => Ruang(
        id: json["id"],
        idGedung: json["id_gedung"],
        idGunaRuang: json["id_guna_ruang"],
        kode: json["kode"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_gedung": idGedung,
        "id_guna_ruang": idGunaRuang,
        "kode": kode,
        "nama": nama,
      };
}

class MataKuliah {
  final int id;
  final String namaResmi;
  final String namaSingkat;
  final String namaAsing;
  final String namaAsingSingkat;
  final int idProdi;
  final int idKurikulum;
  final int semester;
  final String sifat;
  final int idProdiJenjang;
  final String kode;
  final MataKuliahSifat mataKuliahSifat;

  MataKuliah({
    required this.id,
    required this.namaResmi,
    required this.namaSingkat,
    required this.namaAsing,
    required this.namaAsingSingkat,
    required this.idProdi,
    required this.idKurikulum,
    required this.semester,
    required this.sifat,
    required this.idProdiJenjang,
    required this.kode,
    required this.mataKuliahSifat,
  });

  factory MataKuliah.fromRawJson(String str) =>
      MataKuliah.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MataKuliah.fromJson(Map<String, dynamic> json) => MataKuliah(
        id: json["id"],
        namaResmi: json["nama_resmi"],
        namaSingkat: json["nama_singkat"],
        namaAsing: json["nama_asing"],
        namaAsingSingkat: json["nama_asing_singkat"],
        idProdi: json["id_prodi"],
        idKurikulum: json["id_kurikulum"],
        semester: json["semester"],
        sifat: json["sifat"],
        idProdiJenjang: json["id_prodi_jenjang"],
        kode: json["kode"],
        mataKuliahSifat: MataKuliahSifat.fromJson(json["mata_kuliah_sifat"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_resmi": namaResmi,
        "nama_singkat": namaSingkat,
        "nama_asing": namaAsing,
        "nama_asing_singkat": namaAsingSingkat,
        "id_prodi": idProdi,
        "id_kurikulum": idKurikulum,
        "semester": semester,
        "sifat": sifat,
        "id_prodi_jenjang": idProdiJenjang,
        "kode": kode,
        "mata_kuliah_sifat": mataKuliahSifat.toJson(),
      };
}

class MataKuliahSifat {
  final int id;
  final String kode;
  final String singkatan;
  final String nama;

  MataKuliahSifat({
    required this.id,
    required this.kode,
    required this.singkatan,
    required this.nama,
  });

  factory MataKuliahSifat.fromRawJson(String str) =>
      MataKuliahSifat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MataKuliahSifat.fromJson(Map<String, dynamic> json) =>
      MataKuliahSifat(
        id: json["id"],
        kode: json["kode"],
        singkatan: json["singkatan"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "singkatan": singkatan,
        "nama": nama,
      };
}
