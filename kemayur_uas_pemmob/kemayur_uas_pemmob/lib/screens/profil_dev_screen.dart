import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membangun UI
import 'package:url_launcher/url_launcher.dart'; // Mengimpor pustaka untuk meluncurkan URL

class ProfilDevScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Anggota Kelompok 10 - Paralel A', // Judul AppBar
          style: TextStyle(color: Colors.white), // Ubah warna teks judul menjadi putih
        ),
        centerTitle: true, // Menyelaraskan judul di tengah
        backgroundColor: Colors.green, // Warna latar belakang AppBar
        iconTheme: IconThemeData(color: Colors.white), // Mengubah warna ikon (termasuk tombol kembali) menjadi putih
      ),
      body: SingleChildScrollView( // Menggunakan SingleChildScrollView agar konten dapat digulir
        padding: EdgeInsets.all(16.0), // Memberikan padding di sekitar konten
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Mengatur konten di sisi kiri secara horizontal
          children: [
            ProfileCard( // Menampilkan kartu profil untuk anggota pertama
              name: 'Wahyu Kristina Puji Astuti',
              address: 'Jl. Ngagel Rejo 2 No. 8-A',
              phoneNumber: '08813539866',
              email: 'ayhukristina03@gmail.com',
              githubUrl: 'https://github.com/timoy15/KEMAYUR_UAS_PEMMOB',
              profileImage: 'https://iili.io/JpV0JbR.jpg',
              education: 'Sistem Informasi 2022',
              npm: 'NPM: 22082010016', // Menampilkan NPM anggota pertama
            ),
            SizedBox(height: 20), // Jarak antara kartu profil anggota pertama dan kedua
            ProfileCard( // Menampilkan kartu profil untuk anggota kedua
              name: 'Dinda Oktavia Winsa Cahyani',
              address: 'Jl. Raya Gembong Babat Lamongan',
              phoneNumber: '085748918064',
              email: 'dindaoktavia9503@gmail.com',
              githubUrl: 'https://github.com/dindaokta11/Kemayur_UAS_Pemmob',
              profileImage: 'https://iili.io/JpWuavp.jpg',
              education: 'Sistem Informasi 2022',
              npm: 'NPM: 22082010023', // Menampilkan NPM anggota kedua
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String address;
  final String phoneNumber;
  final String email;
  final String githubUrl;
  final String profileImage;
  final String education;
  final String npm; // Variabel NPM untuk menampilkan NPM

  // Konstruktor untuk ProfileCard
  ProfileCard({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.githubUrl,
    required this.profileImage,
    required this.education,
    required this.npm, // Menambahkan required pada konstruktor
  });

  // Fungsi untuk meluncurkan aplikasi email dengan alamat yang ditentukan
  Future<void> _launchEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto', // Skema URL untuk email
      path: email, // Alamat email tujuan
    );
    String url = params.toString(); // Mengonversi URI menjadi string URL
    if (await canLaunch(url)) {
      await launch(url); // Meluncurkan URL jika dapat diluncurkan
    } else {
      throw 'Could not launch $url'; // Melempar kesalahan jika URL tidak dapat diluncurkan
    }
  }

  // Fungsi untuk meluncurkan URL GitHub
  Future<void> _launchGithub(String url) async {
    if (await canLaunch(url)) {
      await launch(url); // Meluncurkan URL jika dapat diluncurkan
    } else {
      throw 'Could not launch $url'; // Melempar kesalahan jika URL tidak dapat diluncurkan
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Memberikan bayangan pada kartu
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Memberikan radius pada sudut kartu
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0), // Memberikan padding di dalam kartu
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Mengatur konten di sisi kiri secara horizontal
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Mengatur konten di sisi atas secara vertikal
              children: [
                CircleAvatar(
                  radius: 40, // Radius avatar
                  backgroundImage: NetworkImage(profileImage), // Gambar avatar dari URL
                ),
                SizedBox(width: 16), // Jarak antara avatar dan teks
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Mengatur konten di sisi kiri secara horizontal
                  children: [
                    Text(
                      name, // Menampilkan nama
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Gaya teks nama
                    ),
                    SizedBox(height: 4), // Jarak antara nama dan NPM
                    Text(
                      npm, // Menampilkan NPM
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]), // Gaya teks NPM
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16), // Jarak antara baris atas dan alamat
            Text('Alamat:', style: TextStyle(fontWeight: FontWeight.bold)), // Label alamat
            SizedBox(height: 4), // Jarak antara label alamat dan alamat
            Text(address), // Menampilkan alamat
            SizedBox(height: 8), // Jarak antara alamat dan nomor telepon
            Text('No. Telepon:', style: TextStyle(fontWeight: FontWeight.bold)), // Label nomor telepon
            SizedBox(height: 4), // Jarak antara label nomor telepon dan nomor telepon
            Text(phoneNumber), // Menampilkan nomor telepon
            SizedBox(height: 8), // Jarak antara nomor telepon dan email
            GestureDetector(
              onTap: () => _launchEmail(email), // Meluncurkan email saat teks diketuk
              child: Text(
                'Email: $email', // Menampilkan email
                style: TextStyle(
                  color: Colors.blue, // Warna teks email
                  decoration: TextDecoration.underline, // Garis bawah pada teks email
                  fontWeight: FontWeight.bold, // Gaya teks tebal pada email
                ),
              ),
            ),
            SizedBox(height: 8), // Jarak antara email dan Github
            Text('Github:', style: TextStyle(fontWeight: FontWeight.bold)), // Label Github
            SizedBox(height: 4), // Jarak antara label Github dan URL Github
            GestureDetector(
              onTap: () => _launchGithub(githubUrl), // Meluncurkan URL GitHub saat teks diketuk
              child: Text(
                githubUrl, // Menampilkan URL GitHub
                style: TextStyle(
                  color: Colors.blue, // Warna teks URL GitHub
                  decoration: TextDecoration.underline, // Garis bawah pada teks URL GitHub
                  fontWeight: FontWeight.bold, // Gaya teks tebal pada URL GitHub
                ),
              ),
            ),
            SizedBox(height: 16), // Jarak antara Github dan pendidikan
            Text(
              'Pendidikan:', // Label pendidikan
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4), // Jarak antara label pendidikan dan pendidikan
            Text(education), // Menampilkan pendidikan
          ],
        ),
      ),
    );
  }
}
