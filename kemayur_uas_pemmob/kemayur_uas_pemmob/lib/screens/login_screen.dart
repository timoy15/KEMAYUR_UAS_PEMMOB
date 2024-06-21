import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membangun UI

// Definisi kelas LoginScreen sebagai StatelessWidget
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Kontroler untuk input email
    final TextEditingController emailController = TextEditingController();
    // Kontroler untuk input password
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      // Scaffold menyediakan struktur dasar untuk layar aplikasi
      backgroundColor: Colors.white, // Warna latar belakang layar
      resizeToAvoidBottomInset: false, // Menghindari perubahan ukuran saat keyboard muncul
      body: Builder(builder: (context) {
        // Builder digunakan untuk mendapatkan konteks yang lebih spesifik
        return Container(
          width: double.infinity, // Lebar kontainer diatur ke penuh layar
          child: Column(
            children: <Widget>[
              Expanded(
                // Expanded digunakan untuk mengisi ruang yang tersedia
                child: Image.network(
                  'https://iili.io/dHftoQe.png', // URL gambar logo
                  width: 300, // Lebar gambar
                  height: 1000, // Tinggi gambar
                ),
                flex: 40, // Proporsi ruang yang diambil oleh gambar
              ),
              Expanded(
                // Expanded digunakan untuk mengisi ruang yang tersedia
                child: Container(
                  margin: EdgeInsets.all(16), // Margin di sekitar kontainer
                  child: Column(
                    children: <Widget>[
                      // Input untuk email
                      TextFormField(
                        controller: emailController, // Kontroler untuk input email
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12), // Padding di dalam input
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4), // Radius sudut border
                          ),
                          labelText: "Email", // Label untuk input email
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4), // Radius sudut border saat fokus
                            borderSide: BorderSide(color: Colors.blue), // Warna border saat fokus
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4), // Radius sudut border saat tidak fokus
                            borderSide: BorderSide(color: Colors.grey), // Warna border saat tidak fokus
                          ),
                          prefixIcon: Icon(Icons.email), // Ikon prefix untuk input email
                        ),
                      ),
                      SizedBox(height: 20), // Jarak vertikal antara input email dan password
                      // Input untuk password
                      TextFormField(
                        controller: passwordController, // Kontroler untuk input password
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12), // Padding di dalam input
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4), // Radius sudut border
                          ),
                          labelText: "Password", // Label untuk input password
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4), // Radius sudut border saat fokus
                            borderSide: BorderSide(color: Colors.blue), // Warna border saat fokus
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4), // Radius sudut border saat tidak fokus
                            borderSide: BorderSide(color: Colors.grey), // Warna border saat tidak fokus
                          ),
                          prefixIcon: Icon(Icons.lock), // Ikon prefix untuk input password
                        ),
                        obscureText: true, // Menyembunyikan teks saat diketik
                      ),
                      SizedBox(height: 20), // Jarak vertikal antara input password dan tombol login
                      Container(
                        width: double.infinity, // Lebar kontainer tombol login penuh
                        child: ElevatedButton(
                          onPressed: () {
                            // Simulasi login sederhana
                            if (emailController.text == 'patricia@gmail.com' && passwordController.text == '123') {
                              Navigator.pushReplacementNamed(context, '/home'); // Navigasi ke halaman home jika login berhasil
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login failed')), // Menampilkan pesan jika login gagal
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Warna background tombol menjadi hijau
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4), // Radius sudut tombol
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12), // Padding di dalam tombol
                            child: Text(
                              'LOGIN', // Teks pada tombol
                              style: TextStyle(fontSize: 14, color: Colors.white), // Gaya teks pada tombol
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Jarak vertikal untuk penataan yang lebih baik
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/signup'); // Navigasi ke halaman signup saat teks diketuk
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center, // Penataan teks di tengah secara horizontal
                          children: <Widget>[
                            Text(
                              "Belum Punya Akun?", // Teks pertanyaan
                              style: TextStyle(fontSize: 14), // Ukuran teks pertanyaan
                            ),
                            SizedBox(width: 4), // Jarak horizontal antara teks pertanyaan dan teks register
                            Text(
                              "Register", // Teks register
                              style: TextStyle(
                                fontSize: 14, // Ukuran teks register
                                color: Colors.blue, // Warna teks register
                                fontWeight: FontWeight.bold, // Tebal teks register
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 60, // Proporsi ruang yang diambil oleh form login
              ),
            ],
          ),
        );
      }),
    );
  }
}