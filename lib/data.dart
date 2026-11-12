import 'package:flutter/material.dart';

const kBg = Color(0xFF07070F);
const kPanel = Color(0xFF0F0F1C);
const kLine = Color(0xFF2A2A44);
const kCyan = Color(0xFF00F0FF);
const kMag = Color(0xFFFF2BD6);
const kText = Color(0xFFEAEAFF);
const kMuted = Color(0xFF8A8AB0);

class Film {
  final String title;
  final String genre;
  final String duration;
  final String director;
  final String cast;
  final String synopsis;
  final bool presale;
  final double hue;

  const Film({
    required this.title,
    required this.genre,
    required this.duration,
    required this.director,
    required this.cast,
    required this.synopsis,
    required this.hue,
    this.presale = false,
  });
}

String posterPath(int index) => 'assets/images/poster_${index + 1}.jpg';

const films = <Film>[
  Film(title: 'Pria Ladang teh', genre: 'Drama', duration: '2j 1m', director: 'Fitri Wulandari', cast: 'Diki Kurnia', synopsis: 'Seorang pria berdiri di tengah ladang Pangalengan, ditemani bayangan orang-orang yang pernah ia tinggalkan.', hue: 200.0),
  Film(title: 'Seporsi Mie Ayam Sebelum Mati', genre: 'Drama', duration: '2j 1m', director: 'Kuntz Agus', cast: 'Benidictus Siregar, Chicco Kurniawan', synopsis: 'Di hari ulang tahunnya, Ale ingin menikmati satu porsi mie ayam favoritnya untuk terakhir kali.', hue: 280.0),
  Film(title: 'People Pleaser', genre: 'Komedi', duration: '1j 48m', director: 'Mawar de Jongh', cast: 'Nama Pemeran A, Nama Pemeran B', synopsis: 'Seorang gadis yang selalu ingin menyenangkan semua orang harus belajar berkata tidak.', hue: 320.0, presale: true),
  Film(title: 'Dewi Siluman Ular', genre: 'Horor', duration: '1j 52m', director: 'Nama Sutradara', cast: 'Nama Pemeran C, Nama Pemeran D', synopsis: 'Sebuah keluarga pindah ke desa tua, dan mulai mendengar cerita tentang sosok yang menjaga hutan.', hue: 150.0),
  Film(title: 'Uzumaki Silvi', genre: 'Action', duration: '1j 40m', director: 'Nama Sutradara', cast: 'Nama Pemeran E', synopsis: 'Sekelompok teman terjebak di vila terpencil tanpa sinyal, dan satu per satu mulai menghilang.', hue: 230.0),
  Film(title: 'Kalangkang', genre: 'Drama', duration: '2j 5m', director: 'Nama Sutradara', cast: 'Nama Pemeran F', synopsis: 'Seorang perantau kembali ke kampung halaman setelah bertahun-tahun, dan menemukan banyak hal berubah.', hue: 260.0),
  Film(title: 'Kebelet kangen', genre: 'Sci-Fi', duration: '2j 10m', director: 'Nama Sutradara', cast: 'Nama Pemeran G, Nama Pemeran H', synopsis: 'Di kota yang tiap malamnya berubah, seorang detektif mencari orang yang hilang tanpa jejak.', hue: 190.0, presale: true),
  Film(title: 'Romantis Harus Berjalan', genre: 'Aksi', duration: '1j 58m', director: 'Nama Sutradara', cast: 'Nama Pemeran I', synopsis: 'Seorang mantan tentara harus kembali bertugas demi melindungi kampung dari ancaman yang tak terduga.', hue: 340.0),
  Film(title: 'Kenangan di kampung teh', genre: 'Romansa', duration: '1j 42m', director: 'Nama Sutradara', cast: 'Nama Pemeran J, Nama Pemeran K', synopsis: 'Dua orang asing bertemu di kafe saat hujan deras, dan cerita kecil mereka berlanjut sejak hari itu.', hue: 210.0),
  Film(title: 'Sirkuit Mimpi', genre: 'Olahraga', duration: '2j 2m', director: 'Nama Sutradara', cast: 'Nama Pemeran L', synopsis: 'Seorang pembalap muda berjuang mengejar mimpinya di tengah tekanan keluarga dan sponsor.', hue: 170.0),
];
