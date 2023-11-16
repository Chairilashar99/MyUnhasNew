class CurrentIndeksPrestasi {
  final int id;
  final int idMahasiswa;
  final String nim;
  final int idSemester;
  final int tahun;
  final int semesterTahunAjaran;
  final String indeksPrestasiSemester;
  final String indeksPrestasiKumulatif;
  final int isGtAkademik;
  final dynamic updatedBy;
  final String createdAt;
  final String updatedAt;
  final int jumlahSks;

  CurrentIndeksPrestasi({
    required this.id,
    required this.idMahasiswa,
    required this.nim,
    required this.idSemester,
    required this.tahun,
    required this.semesterTahunAjaran,
    required this.indeksPrestasiSemester,
    required this.indeksPrestasiKumulatif,
    required this.isGtAkademik,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.jumlahSks,
  });

  factory CurrentIndeksPrestasi.fromJson(Map<String, dynamic> json) {
    return CurrentIndeksPrestasi(
      id: json['id'] as int,
      idMahasiswa: json['id_mahasiswa'] as int,
      nim: json['nim'] as String,
      idSemester: json['id_semester'] as int,
      tahun: json['tahun'] as int,
      semesterTahunAjaran: json['semester_tahun_ajaran'] as int,
      indeksPrestasiSemester: json['indeks_prestasi_semester'] as String,
      indeksPrestasiKumulatif: json['indeks_prestasi_kumulatif'] as String,
      isGtAkademik: json['is_gtakademik'] as int,
      updatedBy: json['updated_by'],
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      jumlahSks: json['jumlah_sks'] as int,
    );
  }
}
