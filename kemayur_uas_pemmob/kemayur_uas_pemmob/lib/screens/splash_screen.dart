import 'package:flutter/material.dart';
import 'package:kemayur_uas_pemmob/screens/login_screen.dart'; // Mengimpor login_screen.dart untuk digunakan dalam routing

// SplashScreen adalah StatelessWidget yang menampilkan logo splash dan kemudian mengarahkan ke LoginScreen saat disentuh.
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scaleFactor = 0.6; // Faktor skala untuk mengurangi ukuran logo splash menjadi 60%

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()), // Navigasi ke halaman LoginScreen saat logo splash disentuh
          );
        },
        child: Center(
          child: Image.network(
            'https://iili.io/d98yub2.png', // URL gambar logo splash, ganti dengan URL logo splash Anda
            width: MediaQuery.of(context).size.width * scaleFactor, // Lebar gambar sesuai dengan lebar layar dikalikan faktor skala
            height: MediaQuery.of(context).size.height * scaleFactor, // Tinggi gambar sesuai dengan tinggi layar dikalikan faktor skala
            fit: BoxFit.cover, // Penyesuaian gambar agar muat dengan baik sesuai dengan lebar dan tinggi yang telah ditentukan
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child; // Jika gambar sudah dimuat, tampilkan gambar
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! // Progress loading gambar dalam persen
                      : null,
                ),
              );
            },
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return Text('Gagal memuat gambar'); // Pesan yang ditampilkan jika gagal memuat gambar
            },
          ),
        ),
      ),
    );
  }
}