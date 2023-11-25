const baseUrl = "https://neosia.devs.unhas.ac.id";

//Auth
const authPath = "$baseUrl/oauth/token";

//Profile
const getProfilePath = "$baseUrl/api/mahasiswa/mahasiswa";

//Indeks Prestasi
const getIndeksPrestasiPath = "$baseUrl/api/mahasiswa/indeks_prestasi/current";

//KHS Mahasiswa untuk Grafik
const getKhsPath = "$baseUrl/api/mahasiswa/kartu_hasil_studi";

//KRS Mahasiswa untuk Jadwal Matakuliah
// const getKrsPath =
//     "$baseUrl/api/mahasiswa/belanja_krs/kartu_rencana_studi_semester?id_semester=51";
const getKrsPath =
    "$baseUrl/api/mahasiswa/belanja_krs/kartu_rencana_studi_semester";

//Semester
const getSemesterPath = "$baseUrl/api/mahasiswa/semester";

//Transkrip
const getTranskripPath =
    "$baseUrl/api/mahasiswa/transkrip/getTranskripMahasiswa";

//Pembayaran
const getPembayaranPath =
    "$baseUrl/api/mahasiswa/pembayaran/getStatusPembayaran";
