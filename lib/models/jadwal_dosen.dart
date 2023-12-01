import 'dart:convert';

class JadwalDosenModel {
  final String message;
  final List<KelasKuliah> kelasKuliahs;

  JadwalDosenModel({
    required this.message,
    required this.kelasKuliahs,
  });

  factory JadwalDosenModel.fromRawJson(String str) =>
      JadwalDosenModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JadwalDosenModel.fromJson(Map<String, dynamic> json) =>
      JadwalDosenModel(
        message: json["message"],
        kelasKuliahs: List<KelasKuliah>.from(
            json["kelasKuliahs"].map((x) => KelasKuliah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "kelasKuliahs": List<dynamic>.from(kelasKuliahs.map((x) => x.toJson())),
      };
}

class KelasKuliah {
  final int id;
  final int idProdiSemester;
  final int idMataKuliah;
  final String nama;
  final MataKuliah mataKuliah;
  final List<JadwalKuliah> jadwalKuliahs;

  KelasKuliah({
    required this.id,
    required this.idProdiSemester,
    required this.idMataKuliah,
    required this.nama,
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
        nama: json["nama"],
        mataKuliah: MataKuliah.fromJson(json["mata_kuliah"]),
        jadwalKuliahs: List<JadwalKuliah>.from(
            json["jadwal_kuliahs"].map((x) => JadwalKuliah.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_prodi_semester": idProdiSemester,
        "id_mata_kuliah": idMataKuliah,
        "nama": nama,
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
  final int dayOfWeek;
  final int idKelasKuliah;
  final MataKuliahSifat ruang;

  JadwalKuliah({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.idRuang,
    required this.dayOfWeek,
    required this.idKelasKuliah,
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
        dayOfWeek: json["day_of_week"],
        idKelasKuliah: json["id_kelas_kuliah"],
        ruang: MataKuliahSifat.fromJson(json["ruang"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_time": startTime,
        "end_time": endTime,
        "id_ruang": idRuang,
        "day_of_week": dayOfWeek,
        "id_kelas_kuliah": idKelasKuliah,
        "ruang": ruang.toJson(),
      };
}

class MataKuliahSifat {
  final int id;
  final String kode;
  final String nama;
  final String singkatan;

  MataKuliahSifat({
    required this.id,
    required this.kode,
    required this.nama,
    required this.singkatan,
  });

  factory MataKuliahSifat.fromRawJson(String str) =>
      MataKuliahSifat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MataKuliahSifat.fromJson(Map<String, dynamic> json) =>
      MataKuliahSifat(
        id: json["id"],
        kode: json["kode"],
        nama: json["nama"],
        singkatan: json["singkatan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "nama": nama,
        "singkatan": singkatan,
      };
}

class MataKuliah {
  final int id;
  final String namaResmi;
  final int idProdi;
  final int idKurikulum;
  final MataKuliahSifat mataKuliahSifat;

  MataKuliah({
    required this.id,
    required this.namaResmi,
    required this.idProdi,
    required this.idKurikulum,
    required this.mataKuliahSifat,
  });

  factory MataKuliah.fromRawJson(String str) =>
      MataKuliah.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MataKuliah.fromJson(Map<String, dynamic> json) => MataKuliah(
        id: json["id"],
        namaResmi: json["nama_resmi"],
        idProdi: json["id_prodi"],
        idKurikulum: json["id_kurikulum"],
        mataKuliahSifat: MataKuliahSifat.fromJson(json["mata_kuliah_sifat"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_resmi": namaResmi,
        "id_prodi": idProdi,
        "id_kurikulum": idKurikulum,
        "mata_kuliah_sifat": mataKuliahSifat.toJson(),
      };
}
