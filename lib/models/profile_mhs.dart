class ProfileMahasiswaModel {
  final dynamic deletedAt;
  final int? id;
  final int? idUser;
  final int? idProdi;
  final int? angkatan;
  final String? namaMahasiswa;
  final String? nim;
  final String? jalan;
  final int? rt;
  final int? rw;
  final String? dusun;
  final String? kodePos;
  final dynamic nisn;
  final String? tempatLahir;
  final dynamic tanggalLahir;
  final String? telepon;
  final dynamic handphone;
  final dynamic idAgama;
  final int? idProdiJenjang;
  final String? kelurahan;
  final dynamic idWilayah;
  final dynamic nik;
  final String? jenisKelamin;
  final int? isActive;
  final int? updatedBy;
  final String? kodeStatus;
  final String? email;
  final int? isTamu;
  final dynamic idMahasiswaPddikti;
  final dynamic idRegistrasiMahasiswaPddikti;
  final dynamic spp;
  final ProdiModel? prodi;
  final dynamic agama;

  ProfileMahasiswaModel({
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
    required this.agama,
  });

  factory ProfileMahasiswaModel.fromJson(Map<String, dynamic> json) =>
      ProfileMahasiswaModel(
        deletedAt: json["deleted_at"],
        id: json["id"],
        idUser: json["id_user"],
        idProdi: json["id_prodi"],
        angkatan: json["angkatan"],
        namaMahasiswa: json["nama_mahasiswa"],
        nim: json["nim"],
        jalan: json["jalan"],
        rt: json["rt"],
        rw: json["rw"],
        dusun: json["dusun"],
        kodePos: json["kode_pos"],
        nisn: json["nisn"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"],
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
        kodeStatus: json["kode_status"],
        email: json["email"],
        isTamu: json["is_tamu"],
        idMahasiswaPddikti: json["id_mahasiswa_pddikti"],
        idRegistrasiMahasiswaPddikti: json["id_registrasi_mahasiswa_pddikti"],
        spp: json["spp"],
        prodi: ProdiModel.fromJson(json["prodi"]),
        agama: json["agama"],
      );

  Map<String, dynamic> toJson() => {
        "deleted_at": deletedAt,
        "id": id,
        "id_user": idUser,
        "id_prodi": idProdi,
        "angkatan": angkatan,
        "nama_mahasiswa": namaMahasiswa,
        "nim": nim,
        "jalan": jalan,
        "rt": rt,
        "rw": rw,
        "dusun": dusun,
        "kode_pos": kodePos,
        "nisn": nisn,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir,
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
        "kode_status": kodeStatus,
        "email": email,
        "is_tamu": isTamu,
        "id_mahasiswa_pddikti": idMahasiswaPddikti,
        "id_registrasi_mahasiswa_pddikti": idRegistrasiMahasiswaPddikti,
        "spp": spp,
        "prodi": prodi?.toJson(),
        "agama": agama,
      };
}

class ProdiModel {
  final int? id;
  final String? kodeDikti;
  final String? namaResmi;
  final dynamic namaSingkat;
  final dynamic namaAsing;
  final dynamic namaAsingSingkat;
  final int? isEksakta;
  final dynamic alamat;
  final dynamic nomorTelepon;
  final dynamic fax;
  final String? email;
  final dynamic website;
  final DateTime? updatedAt;
  final int? isActive;
  final String? idPddikti;
  final FakultasModel? fakultas;

  ProdiModel({
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

  factory ProdiModel.fromJson(Map<String, dynamic> json) => ProdiModel(
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
        fakultas: FakultasModel.fromJson(json["fakultas"]),
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
        "updated_at": updatedAt?.toIso8601String(),
        "is_active": isActive,
        "id_pddikti": idPddikti,
        "fakultas": fakultas?.toJson(),
      };
}

class FakultasModel {
  final int? id;
  final String? namaResmi;
  final dynamic namaSingkat;
  final dynamic namaAsing;
  final dynamic namaAsingSingkat;
  final dynamic alamat;
  final dynamic nomorTelepon;
  final dynamic fax;
  final String? email;
  final dynamic website;
  final String? kode;

  FakultasModel({
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

  factory FakultasModel.fromJson(Map<String, dynamic> json) => FakultasModel(
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
