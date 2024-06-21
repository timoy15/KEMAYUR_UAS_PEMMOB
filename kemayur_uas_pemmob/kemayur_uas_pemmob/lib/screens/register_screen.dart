import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter yang diperlukan untuk membangun UI

class RegisterScreen extends StatelessWidget {
  // Controller untuk mengelola input dari pengguna
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi untuk melakukan registrasi pengguna
  void registerUser(BuildContext context) {
    // Simulasi proses registrasi (tanpa backend atau API)
    // Biasanya, Anda akan melakukan http.post() ke API untuk registrasi
    // Di sini hanya menampilkan notifikasi
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Registration Successful"), // Judul dialog
          content: Text("You have successfully registered!"), // Isi dari dialog
          actions: <Widget>[
            TextButton(
              child: Text("OK"), // Tombol OK
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                Navigator.pushReplacementNamed(context, '/login'); // Navigasi ke halaman login setelah registrasi sukses
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'), // Judul AppBar
      ),
      body: SingleChildScrollView( // Menggunakan SingleChildScrollView untuk mengatasi overflow jika konten melebihi layar
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Padding sekitar konten
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Mengatur konten agar berada di tengah secara vertikal
              crossAxisAlignment: CrossAxisAlignment.stretch, // Mengatur konten agar membentang secara horizontal
              children: <Widget>[
                Image.network(
                  'https://iili.io/dHftoQe.png', // URL logo yang ditampilkan
                  width: 200, // Lebar gambar
                  height: 150, // Tinggi gambar
                ),
                SizedBox(height: 16), // Memberikan jarak antara gambar dan input field
                TextFormField(
                  controller: nameController, // Controller untuk input nama
                  decoration: InputDecoration(
                    labelText: "Name", // Label input nama
                    prefixIcon: Icon(Icons.person), // Icon di depan input nama
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4), // Border radius input
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Padding konten input
                  ),
                ),
                SizedBox(height: 12), // Memberikan jarak antara input fields
                TextFormField(
                  controller: addressController, // Controller untuk input alamat
                  decoration: InputDecoration(
                    labelText: "Address", // Label input alamat
                    prefixIcon: Icon(Icons.home), // Icon di depan input alamat
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4), // Border radius input
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Padding konten input
                  ),
                ),
                SizedBox(height: 12), // Memberikan jarak antara input fields
                TextFormField(
                  controller: phoneController, // Controller untuk input nomor telepon
                  decoration: InputDecoration(
                    labelText: "Phone Number", // Label input nomor telepon
                    prefixIcon: Icon(Icons.phone), // Icon di depan input nomor telepon
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4), // Border radius input
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Padding konten input
                  ),
                ),
                SizedBox(height: 12), // Memberikan jarak antara input fields
                TextFormField(
                  controller: emailController, // Controller untuk input email
                  decoration: InputDecoration(
                    labelText: "Email", // Label input email
                    prefixIcon: Icon(Icons.email), // Icon di depan input email
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4), // Border radius input
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Padding konten input
                  ),
                ),
                SizedBox(height: 12), // Memberikan jarak antara input fields
                TextFormField(
                  controller: passwordController, // Controller untuk input password
                  decoration: InputDecoration(
                    labelText: "Password", // Label input password
                    prefixIcon: Icon(Icons.lock), // Icon di depan input password
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4), // Border radius input
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // Padding konten input
                  ),
                  obscureText: true, // Mengubah input password menjadi tidak terlihat
                ),
                SizedBox(height: 24), // Memberikan jarak sebelum tombol
                ElevatedButton(
                  onPressed: () {
                    registerUser(context); // Panggil fungsi registerUser saat tombol ditekan
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Ubah warna background tombol menjadi hijau
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 16)), // Padding tombol
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4), // Border radius tombol
                      ),
                    ),
                    elevation: MaterialStateProperty.all<double>(3), // Elevasi tombol untuk efek tiga dimensi
                  ),
                  child: Text(
                    'REGISTER', // Teks pada tombol
                    style: TextStyle(fontSize: 16, color: Colors.white), // Gaya teks pada tombol
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}