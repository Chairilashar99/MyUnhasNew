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
        indeksPrestasiSemester: json["indeks_prestasi_semester"],
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
  // final List<KartuHasilStudi>? kartuHasilStudi;

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
    // this.kartuHasilStudi,
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
        // kartuHasilStudi: json["kartu_hasil_studi"] == null
        //     ? []
        //     : List<KartuHasilStudi>.from(json["kartu_hasil_studi"]!
        //         .map((x) => KartuHasilStudi.fromJson(x))),
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
        // "kartu_hasil_studi": kartuHasilStudi == null
        //     ? []
        //     : List<dynamic>.from(kartuHasilStudi!.map((x) => x.toJson())),
      };
}

enum Jenis { GANJIL, GENAP }

final jenisValues = EnumValues({"ganjil": Jenis.GANJIL, "genap": Jenis.GENAP});

// class KartuHasilStudi {
//   final MataKuliah? mataKuliah;
//   final NilaiHuruf? nilaiHuruf;
//   final String? nilaiAngka;
//   final Source? source;
//   final int? idTranskrip;
//   final int? idKelasKuliahNilaiAkhir;

//   KartuHasilStudi({
//     this.mataKuliah,
//     this.nilaiHuruf,
//     this.nilaiAngka,
//     this.source,
//     this.idTranskrip,
//     this.idKelasKuliahNilaiAkhir,
//   });

//   factory KartuHasilStudi.fromRawJson(String str) =>
//       KartuHasilStudi.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory KartuHasilStudi.fromJson(Map<String, dynamic> json) =>
//       KartuHasilStudi(
//         mataKuliah: json["mata_kuliah"] == null
//             ? null
//             : MataKuliah.fromJson(json["mata_kuliah"]),
//         nilaiHuruf: nilaiHurufValues.map[json["nilai_huruf"]]!,
//         nilaiAngka: json["nilai_angka"],
//         source: sourceValues.map[json["source"]]!,
//         idTranskrip: json["id_transkrip"],
//         idKelasKuliahNilaiAkhir: json["id_kelas_kuliah_nilai_akhir"],
//       );

//   Map<String, dynamic> toJson() => {
//         "mata_kuliah": mataKuliah?.toJson(),
//         "nilai_huruf": nilaiHurufValues.reverse[nilaiHuruf],
//         "nilai_angka": nilaiAngka,
//         "source": sourceValues.reverse[source],
//         "id_transkrip": idTranskrip,
//         "id_kelas_kuliah_nilai_akhir": idKelasKuliahNilaiAkhir,
//       };
// }

// class MataKuliah {
//   final int? id;
//   final String? namaResmi;
//   final String? namaSingkat;
//   final String? namaAsing;
//   final String? namaAsingSingkat;
//   final int? idProdi;
//   final int? idKurikulum;
//   final int? createdBy;
//   final String? updatedBy;
//   final int? semester;
//   final NilaiHuruf? sifat;
//   final int? idProdiJenjang;
//   final String? kode;
//   final int? isMataKuliahUmum;
//   final String? idPddikti;
//   final int? idKelasKuliahJenis;
//   final int? isKemajuanStudi;
//   final List<MataKuliahJumlahSkse>? mataKuliahJumlahSkses;

//   MataKuliah({
//     this.id,
//     this.namaResmi,
//     this.namaSingkat,
//     this.namaAsing,
//     this.namaAsingSingkat,
//     this.idProdi,
//     this.idKurikulum,
//     this.createdBy,
//     this.updatedBy,
//     this.semester,
//     this.sifat,
//     this.idProdiJenjang,
//     this.kode,
//     this.isMataKuliahUmum,
//     this.idPddikti,
//     this.idKelasKuliahJenis,
//     this.isKemajuanStudi,
//     this.mataKuliahJumlahSkses,
//   });

//   factory MataKuliah.fromRawJson(String str) =>
//       MataKuliah.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory MataKuliah.fromJson(Map<String, dynamic> json) => MataKuliah(
//         id: json["id"],
//         namaResmi: json["nama_resmi"],
//         namaSingkat: json["nama_singkat"],
//         namaAsing: json["nama_asing"],
//         namaAsingSingkat: json["nama_asing_singkat"],
//         idProdi: json["id_prodi"],
//         idKurikulum: json["id_kurikulum"],
//         createdBy: json["created_by"],
//         updatedBy: json["updated_by"],
//         semester: json["semester"],
//         sifat: nilaiHurufValues.map[json["sifat"]]!,
//         idProdiJenjang: json["id_prodi_jenjang"],
//         kode: json["kode"],
//         isMataKuliahUmum: json["is_mata_kuliah_umum"],
//         idPddikti: json["id_pddikti"],
//         idKelasKuliahJenis: json["id_kelas_kuliah_jenis"],
//         isKemajuanStudi: json["is_kemajuan_studi"],
//         mataKuliahJumlahSkses: json["mata_kuliah_jumlah_skses"] == null
//             ? []
//             : List<MataKuliahJumlahSkse>.from(json["mata_kuliah_jumlah_skses"]!
//                 .map((x) => MataKuliahJumlahSkse.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "nama_resmi": namaResmi,
//         "nama_singkat": namaSingkat,
//         "nama_asing": namaAsing,
//         "nama_asing_singkat": namaAsingSingkat,
//         "id_prodi": idProdi,
//         "id_kurikulum": idKurikulum,
//         "created_by": createdBy,
//         "updated_by": updatedBy,
//         "semester": semester,
//         "sifat": nilaiHurufValues.reverse[sifat],
//         "id_prodi_jenjang": idProdiJenjang,
//         "kode": kode,
//         "is_mata_kuliah_umum": isMataKuliahUmum,
//         "id_pddikti": idPddikti,
//         "id_kelas_kuliah_jenis": idKelasKuliahJenis,
//         "is_kemajuan_studi": isKemajuanStudi,
//         "mata_kuliah_jumlah_skses": mataKuliahJumlahSkses == null
//             ? []
//             : List<dynamic>.from(mataKuliahJumlahSkses!.map((x) => x.toJson())),
//       };
// }

// class MataKuliahJumlahSkse {
//   final int? id;
//   final int? idMataKuliah;
//   final int? idTipeSks;
//   final int? jumlahSks;

//   MataKuliahJumlahSkse({
//     this.id,
//     this.idMataKuliah,
//     this.idTipeSks,
//     this.jumlahSks,
//   });

//   factory MataKuliahJumlahSkse.fromRawJson(String str) =>
//       MataKuliahJumlahSkse.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory MataKuliahJumlahSkse.fromJson(Map<String, dynamic> json) =>
//       MataKuliahJumlahSkse(
//         id: json["id"],
//         idMataKuliah: json["id_mata_kuliah"],
//         idTipeSks: json["id_tipe_sks"],
//         jumlahSks: json["jumlah_sks"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "id_mata_kuliah": idMataKuliah,
//         "id_tipe_sks": idTipeSks,
//         "jumlah_sks": jumlahSks,
//       };
// }

// enum NilaiHuruf { A, B, EMPTY, K, M, NILAI_HURUF_A, NILAI_HURUF_B, TM }

// final nilaiHurufValues = EnumValues({
//   "A": NilaiHuruf.A,
//   "B+": NilaiHuruf.B,
//   "": NilaiHuruf.EMPTY,
//   "K": NilaiHuruf.K,
//   "M": NilaiHuruf.M,
//   "A-": NilaiHuruf.NILAI_HURUF_A,
//   "B": NilaiHuruf.NILAI_HURUF_B,
//   "TM": NilaiHuruf.TM
// });

// enum Source { NILAI_AKHIR, TRANSKRIP }

// final sourceValues = EnumValues(
//     {"Nilai Akhir": Source.NILAI_AKHIR, "Transkrip": Source.TRANSKRIP});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
