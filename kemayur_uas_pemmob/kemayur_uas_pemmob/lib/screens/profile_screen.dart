import 'dart:io'; // Mengimpor pustaka Dart untuk operasi file

import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membangun UI
import 'package:image_picker/image_picker.dart'; // Mengimpor pustaka untuk memilih gambar dari galeri atau kamera
import 'package:url_launcher/url_launcher.dart'; // Mengimpor pustaka untuk meluncurkan URL
import 'profil_dev_screen.dart'; // Mengimpor halaman profil developer

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState(); // Membuat state untuk ProfileScreen
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Membuat controller untuk mengelola input teks
  TextEditingController _namaController = TextEditingController(text: 'Patricia');
  TextEditingController _alamatController = TextEditingController(text: 'Rungkut');
  TextEditingController _teleponController = TextEditingController(text: '08813539866');
  TextEditingController _emailController = TextEditingController(text: 'patricia@gmail.com');

  File? _image; // Menyimpan file gambar yang dipilih, diinisialisasi dengan null

  // Fungsi untuk memilih gambar dari galeri atau kamera
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source); // Mengambil gambar dari sumber yang ditentukan

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path); // Jika gambar dipilih, simpan di _image
      } else {
        print('No image selected.'); // Jika tidak ada gambar yang dipilih
      }
    });
  }

  // Fungsi untuk menyimpan perubahan data profil
  void _saveChanges() {
    setState(() {
      // Memperbarui data profil dengan nilai baru dari controller
      _namaController.text = _namaController.text;
      _alamatController.text = _alamatController.text;
      _teleponController.text = _teleponController.text;
      _emailController.text = _emailController.text;

      // Menampilkan snackbar untuk menunjukkan bahwa perubahan telah disimpan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Changes saved')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil User', // Judul AppBar
          style: TextStyle(color: Colors.white), // Mengubah warna teks menjadi putih
        ),
        backgroundColor: Colors.green, // Mengubah warna latar belakang AppBar menjadi hijau
        iconTheme: IconThemeData(color: Colors.white), // Mengubah warna ikon (termasuk tombol kembali) menjadi putih
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.teal], // Warna gradien dari hijau ke teal
            begin: Alignment.topCenter, // Awal gradien di bagian atas
            end: Alignment.bottomCenter, // Akhir gradien di bagian bawah
            stops: [0.0, 1.0], // Set gradien dari atas ke bawah penuh
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0), // Padding di sekitar konten
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Mengatur konten di tengah secara horizontal
            children: [
              GestureDetector(
                onTap: () => _pickImage(ImageSource.gallery), // Memilih gambar dari galeri saat avatar diketuk
                child: CircleAvatar(
                  radius: 50, // Radius avatar
                  backgroundImage: _image != null 
                    ? FileImage(_image!) as ImageProvider<Object> 
                    : NetworkImage('https://iili.io/dHoHydP.jpg'), // Gambar avatar, jika tidak ada, gunakan URL profil developer
                ),
              ),
              SizedBox(height: 16), // Memberikan jarak antara avatar dan input field
              TextFormField(
                controller: _namaController, // Controller untuk input nama
                style: TextStyle(color: Colors.white), // Warna teks
                decoration: InputDecoration(
                  labelText: 'Nama', // Label input nama
                  labelStyle: TextStyle(color: Colors.white), // Warna teks label
                  prefixIcon: Icon(Icons.person, color: Colors.white), // Warna ikon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0), // Warna dan lebar border
                    borderRadius: BorderRadius.circular(8.0), // Radius border
                  ),
                ),
              ),
              SizedBox(height: 8), // Memberikan jarak antara input fields
              TextFormField(
                controller: _alamatController, // Controller untuk input alamat
                style: TextStyle(color: Colors.white), // Warna teks
                decoration: InputDecoration(
                  labelText: 'Alamat', // Label input alamat
                  labelStyle: TextStyle(color: Colors.white), // Warna teks label
                  prefixIcon: Icon(Icons.home, color: Colors.white), // Warna ikon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0), // Warna dan lebar border
                    borderRadius: BorderRadius.circular(8.0), // Radius border
                  ),
                ),
              ),
              SizedBox(height: 8), // Memberikan jarak antara input fields
              TextFormField(
                controller: _teleponController, // Controller untuk input nomor telepon
                style: TextStyle(color: Colors.white), // Warna teks
                decoration: InputDecoration(
                  labelText: 'No. Telepon', // Label input nomor telepon
                  labelStyle: TextStyle(color: Colors.white), // Warna teks label
                  prefixIcon: Icon(Icons.phone, color: Colors.white), // Warna ikon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0), // Warna dan lebar border
                    borderRadius: BorderRadius.circular(8.0), // Radius border
                  ),
                ),
              ),
              SizedBox(height: 8), // Memberikan jarak antara input fields
              TextFormField(
                controller: _emailController, // Controller untuk input email
                style: TextStyle(color: Colors.white), // Warna teks
                decoration: InputDecoration(
                  labelText: 'Email', // Label input email
                  labelStyle: TextStyle(color: Colors.white), // Warna teks label
                  prefixIcon: Icon(Icons.email, color: Colors.white), // Warna ikon
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0), // Warna dan lebar border
                    borderRadius: BorderRadius.circular(8.0), // Radius border
                  ),
                ),
              ),
              SizedBox(height: 16), // Memberikan jarak sebelum tombol
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Mengatur konten di tengah secara horizontal
                children: [
                  ElevatedButton(
                    onPressed: _saveChanges, // Memanggil fungsi _saveChanges saat tombol ditekan
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Warna latar belakang tombol
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.green), // Warna teks tombol
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Padding tombol
                      ),
                    ),
                    child: Text(
                      'Save Changes', // Teks pada tombol
                      style: TextStyle(fontSize: 16), // Gaya teks pada tombol
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(), // Spacer untuk menjaga tombol Profil Developer di bagian bawah
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman profil developer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilDevScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Warna latar belakang tombol
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.green), // Warna teks tombol
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 150, vertical: 20), // Padding tombol
                  ),
                ),
                child: Text(
                  'Profil Developer', // Teks pada tombol
                  style: TextStyle(fontSize: 16), // Gaya teks pada tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
}