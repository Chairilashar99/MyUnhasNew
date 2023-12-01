import 'dart:convert';

class TranskripModel {
  final String message;
  final Mahasiswa mahasiswa;
  final List<Transkrip> transkrip;

  TranskripModel({
    required this.message,
    required this.mahasiswa,
    required this.transkrip,
  });

  factory TranskripModel.fromRawJson(String str) =>
      TranskripModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TranskripModel.fromJson(Map<String, dynamic> json) => TranskripModel(
        message: json["message"],
        mahasiswa: Mahasiswa.fromJson(json["mahasiswa"]),
        transkrip: List<Transkrip>.from(
            json["transkrip"].map((x) => Transkrip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "mahasiswa": mahasiswa.toJson(),
        "transkrip": List<dynamic>.from(transkrip.map((x) => x.toJson())),
      };
}

enum Nim { D121201099 }

final nimValues = EnumValues({"D121201099": Nim.D121201099});

class Mahasiswa {
  final dynamic deletedAt;
  final int id;
  final int idUser;
  final int idProdi;
  final int angkatan;
  final String namaMahasiswa;
  final Nim nim;
  final String jalan;
  final int rt;
  final int rw;
  final String dusun;
  final String kodePos;
  final String nisn;
  final String tempatLahir;
  final DateTime tanggalLahir;
  final String telepon;
  final String handphone;
  final dynamic idAgama;
  final int idProdiJenjang;
  final String kelurahan;
  final String idWilayah;
  final String nik;
  final String jenisKelamin;
  final int isActive;
  final int updatedBy;
  final KodeStatus kodeStatus;
  final String email;
  final int isTamu;
  final String idMahasiswaPddikti;
  final String idRegistrasiMahasiswaPddikti;
  final dynamic spp;
  final Prodi prodi;
  final ProdiJenjang prodiJenjang;

  Mahasiswa({
    required this.deletedAt,
    required this.id,
    required this.idUser,
    required this.idProdi,
    required this.angkatan,
    required this.namaMahasiswa,
    required this.nim,
    required this.jalan,
    required this.rt,
    required this.rw,
    required this.dusun,
    required this.kodePos,
    required this.nisn,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.telepon,
    required this.handphone,
    required this.idAgama,
    required this.idProdiJenjang,
    required this.kelurahan,
    required this.idWilayah,
    required this.nik,
    required this.jenisKelamin,
    required this.isActive,
    required this.updatedBy,
    required this.kodeStatus,
    required this.email,
    required this.isTamu,
    required this.idMahasiswaPddikti,
    required this.idRegistrasiMahasiswaPddikti,
    required this.spp,
    required this.prodi,
    required this.prodiJenjang,
  });

  factory Mahasiswa.fromRawJson(String str) =>
      Mahasiswa.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        deletedAt: json["deleted_at"],
        id: json["id"],
        idUser: json["id_user"],
        idProdi: json["id_prodi"],
        angkatan: json["angkatan"],
        namaMahasiswa: json["nama_mahasiswa"],
        nim: nimValues.map[json["nim"]]!,
        jalan: json["jalan"],
        rt: json["rt"],
        rw: json["rw"],
        dusun: json["dusun"],
        kodePos: json["kode_pos"],
        nisn: json["nisn"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        telepon: json["telepon"],
        handphone: json["handphone"],
        idAgama: json["id_agama"],
        idProdiJenjang: json["id_prodi_jenjang"],
        kelurahan: json["kelurahan"],
        idWilayah: json["id_wilayah"],
        nik: json["nik"],
        jenisKelamin: json["jenis_kelamin"],
        isActive: json["is_active"],
        updatedBy: json["updated_by"],
        kodeStatus: kodeStatusValues.map[json["kode_status"]]!,
        email: json["email"],
        isTamu: json["is_tamu"],
        idMahasiswaPddikti: json["id_mahasiswa_pddikti"],
        idRegistrasiMahasiswaPddikti: json["id_registrasi_mahasiswa_pddikti"],
        spp: json["spp"],
        prodi: Prodi.fromJson(json["prodi"]),
        prodiJenjang: ProdiJenjang.fromJson(json["prodi_jenjang"]),
      );

  Map<String, dynamic> toJson() => {
        "deleted_at": deletedAt,
        "id": id,
        "id_user": idUser,
        "id_prodi": idProdi,
        "angkatan": angkatan,
        "nama_mahasiswa": namaMahasiswa,
        "nim": nimValues.reverse[nim],
        "jalan": jalan,
        "rt": rt,
        "rw": rw,
        "dusun": dusun,
        "kode_pos": kodePos,
        "nisn": nisn,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir":
            "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "telepon": telepon,
        "handphone": handphone,
        "id_agama": idAgama,
        "id_prodi_jenjang": idProdiJenjang,
        "kelurahan": kelurahan,
        "id_wilayah": idWilayah,
        "nik": nik,
        "jenis_kelamin": jenisKelamin,
        "is_active": isActive,
        "updated_by": updatedBy,
        "kode_status": kodeStatusValues.reverse[kodeStatus],
        "email": email,
        "is_tamu": isTamu,
        "id_mahasiswa_pddikti": idMahasiswaPddikti,
        "id_registrasi_mahasiswa_pddikti": idRegistrasiMahasiswaPddikti,
        "spp": spp,
        "prodi": prodi.toJson(),
        "prodi_jenjang": prodiJenjang.toJson(),
      };
}

enum KodeStatus { A, B, C, KODE_STATUS_A, KODE_STATUS_B }

final kodeStatusValues = EnumValues({
  "A-": KodeStatus.A,
  "B": KodeStatus.B,
  "C+": KodeStatus.C,
  "A": KodeStatus.KODE_STATUS_A,
  "B+": KodeStatus.KODE_STATUS_B
});

class Prodi {
  final int id;
  final String kodeDikti;
  final String namaResmi;
  final String namaSingkat;
  final String namaAsing;
  final dynamic namaAsingSingkat;
  final int isEksakta;
  final String alamat;
  final String nomorTelepon;
  final String fax;
  final String email;
  final String website;
  final DateTime updatedAt;
  final int isActive;
  final String idPddikti;
  final Fakultas fakultas;

  Prodi({
    required this.id,
    required this.kodeDikti,
    required this.namaResmi,
    required this.namaSingkat,
    required this.namaAsing,
    required this.namaAsingSingkat,
    required this.isEksakta,
    required this.alamat,
    required this.nomorTelepon,
    required this.fax,
    required this.email,
    required this.website,
    required this.updatedAt,
    required this.isActive,
    required this.idPddikti,
    required this.fakultas,
  });

  factory Prodi.fromRawJson(String str) => Prodi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Prodi.fromJson(Map<String, dynamic> json) => Prodi(
        id: json["id"],
        kodeDikti: json["kode_dikti"],
        namaResmi: json["nama_resmi"],
        namaSingkat: json["nama_singkat"],
        namaAsing: json["nama_asing"],
        namaAsingSingkat: json["nama_asing_singkat"],
        isEksakta: json["is_eksakta"],
        alamat: json["alamat"],
        nomorTelepon: json["nomor_telepon"],
        fax: json["fax"],
        email: json["email"],
        website: json["website"],
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"],
        idPddikti: json["id_pddikti"],
        fakultas: Fakultas.fromJson(json["fakultas"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode_dikti": kodeDikti,
        "nama_resmi": namaResmi,
        "nama_singkat": namaSingkat,
        "nama_asing": namaAsing,
        "nama_asing_singkat": namaAsingSingkat,
        "is_eksakta": isEksakta,
        "alamat": alamat,
        "nomor_telepon": nomorTelepon,
        "fax": fax,
        "email": email,
        "website": website,
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "id_pddikti": idPddikti,
        "fakultas": fakultas.toJson(),
      };
}

class Fakultas {
  final int id;
  final String namaResmi;
  final String namaSingkat;
  final String namaAsing;
  final dynamic namaAsingSingkat;
  final dynamic alamat;
  final String nomorTelepon;
  final String fax;
  final String email;
  final String website;
  final String kode;

  Fakultas({
    required this.id,
    required this.namaResmi,
    required this.namaSingkat,
    required this.namaAsing,
    required this.namaAsingSingkat,
    required this.alamat,
    required this.nomorTelepon,
    required this.fax,
    required this.email,
    required this.website,
    required this.kode,
  });

  factory Fakultas.fromRawJson(String str) =>
      Fakultas.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fakultas.fromJson(Map<String, dynamic> json) => Fakultas(
        id: json["id"],
        namaResmi: json["nama_resmi"],
        namaSingkat: json["nama_singkat"],
        namaAsing: json["nama_asing"],
        namaAsingSingkat: json["nama_asing_singkat"],
        alamat: json["alamat"],
        nomorTelepon: json["nomor_telepon"],
        fax: json["fax"],
        email: json["email"],
        website: json["website"],
        kode: json["kode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_resmi": namaResmi,
        "nama_singkat": namaSingkat,
        "nama_asing": namaAsing,
        "nama_asing_singkat": namaAsingSingkat,
        "alamat": alamat,
        "nomor_telepon": nomorTelepon,
        "fax": fax,
        "email": email,
        "website": website,
        "kode": kode,
      };
}

class ProdiJenjang {
  final int id;
  final String kode;
  final String nama;
  final int maxSks;
  final int maxSemester;

  ProdiJenjang({
    required this.id,
    required this.kode,
    required this.nama,
    required this.maxSks,
    required this.maxSemester,
  });

  factory ProdiJenjang.fromRawJson(String str) =>
      ProdiJenjang.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProdiJenjang.fromJson(Map<String, dynamic> json) => ProdiJenjang(
        id: json["id"],
        kode: json["kode"],
        nama: json["nama"],
        maxSks: json["max_sks"],
        maxSemester: json["max_semester"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "nama": nama,
        "max_sks": maxSks,
        "max_semester": maxSemester,
      };
}

class Transkrip {
  final int id;
  final int idMahasiswa;
  final Nim nim;
  final int idSemester;
  final int idKelasKuliah;
  final int idMataKuliah;
  final String kodeMataKuliah;
  final String namaMataKuliah;
  final String namaAsingMataKuliah;
  final String nilaiAngka;
  final KodeStatus nilaiHuruf;
  final int sks;
  final String totalNilai;
  final int isUsed;
  final int isVerified;
  final int isGtakademik;
  final dynamic updatedBy;
  final dynamic createdAt;
  final dynamic updatedAt;
  final int isManual;
  final dynamic isAlihKredit;
  final int isLocked;

  Transkrip({
    required this.id,
    required this.idMahasiswa,
    required this.nim,
    required this.idSemester,
    required this.idKelasKuliah,
    required this.idMataKuliah,
    required this.kodeMataKuliah,
    required this.namaMataKuliah,
    required this.namaAsingMataKuliah,
    required this.nilaiAngka,
    required this.nilaiHuruf,
    required this.sks,
    required this.totalNilai,
    required this.isUsed,
    required this.isVerified,
    required this.isGtakademik,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.isManual,
    required this.isAlihKredit,
    required this.isLocked,
  });

  factory Transkrip.fromRawJson(String str) =>
      Transkrip.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Transkrip.fromJson(Map<String, dynamic> json) => Transkrip(
        id: json["id"],
        idMahasiswa: json["id_mahasiswa"],
        nim: nimValues.map[json["nim"]]!,
        idSemester: json["id_semester"],
        idKelasKuliah: json["id_kelas_kuliah"],
        idMataKuliah: json["id_mata_kuliah"],
        kodeMataKuliah: json["kode_mata_kuliah"],
        namaMataKuliah: json["nama_mata_kuliah"],
        namaAsingMataKuliah: json["nama_asing_mata_kuliah"],
        nilaiAngka: json["nilai_angka"],
        nilaiHuruf: kodeStatusValues.map[json["nilai_huruf"]]!,
        sks: json["sks"],
        totalNilai: json["total_nilai"],
        isUsed: json["is_used"],
        isVerified: json["is_verified"],
        isGtakademik: json["is_gtakademik"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        isManual: json["is_manual"],
        isAlihKredit: json["is_alih_kredit"],
        isLocked: json["is_locked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_mahasiswa": idMahasiswa,
        "nim": nimValues.reverse[nim],
        "id_semester": idSemester,
        "id_kelas_kuliah": idKelasKuliah,
        "id_mata_kuliah": idMataKuliah,
        "kode_mata_kuliah": kodeMataKuliah,
        "nama_mata_kuliah": namaMataKuliah,
        "nama_asing_mata_kuliah": namaAsingMataKuliah,
        "nilai_angka": nilaiAngka,
        "nilai_huruf": kodeStatusValues.reverse[nilaiHuruf],
        "sks": sks,
        "total_nilai": totalNilai,
        "is_used": isUsed,
        "is_verified": isVerified,
        "is_gtakademik": isGtakademik,
        "updated_by": updatedBy,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "is_manual": isManual,
        "is_alih_kredit": isAlihKredit,
        "is_locked": isLocked,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
