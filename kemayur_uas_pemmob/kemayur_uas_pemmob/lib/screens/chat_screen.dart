import 'package:flutter/material.dart';  // Import library dari Flutter untuk UI

void main() {
  runApp(AplikasiSaya());  // Menjalankan aplikasi Flutter
}

class AplikasiSaya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Menghilangkan banner debug di atas aplikasi
      title: 'Chat Penjual Sayur',  // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.green,  // Tema warna primer aplikasi
      ),
      home: ChatScreen(),  // Halaman awal aplikasi adalah ChatScreen
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();  // Membuat state untuk ChatScreen
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, String>> pesan = [
    {"role": "penjual", "text": "Selamat datang di chat KemaYur app ! Ada yang bisa dibantu ?"}
  ];  // List pesan dalam bentuk Map yang berisi role (penjual/pelanggan) dan text pesan
  TextEditingController pesanController = TextEditingController();  // Controller untuk TextField
  bool isPenjual = false;  // Variabel untuk menandai apakah user saat ini adalah penjual atau tidak

  Map<String, String> balasanOtomatis = {
    "stok": "Stok sayur kami masih cukup, silakan pesan sekarang!",
    "kualitas": "Sayuran kami selalu fresh, silakan dipesan"
  };  // Map untuk menyimpan balasan otomatis berdasarkan kata kunci

  void kirimPesan() {
    String pesanBaru = pesanController.text.trim();  // Mendapatkan pesan baru dari input
    if (pesanBaru.isNotEmpty) {  // Memastikan pesan tidak kosong
      setState(() {
        pesan.add({"role": isPenjual ? "penjual" : "pelanggan", "text": pesanBaru});  // Menambahkan pesan baru ke list pesan
        pesanController.clear();  // Membersihkan input setelah mengirim pesan
      });

      // Jika yang mengirim pesan adalah penjual, tambahkan balasan otomatis dari penjual
      if (isPenjual) {
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            pesan.add({
              "role": "penjual",
              "text": balasOtomatisPenjual(pesanBaru),  // Memanggil fungsi balasOtomatisPenjual
            });
          });
        });
      } else {
        // Jika yang mengirim pesan adalah pelanggan, tambahkan balasan otomatis jika ada kata kunci yang cocok
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            pesan.add({
              "role": "penjual",
              "text": balasOtomatisPelanggan(pesanBaru),  // Memanggil fungsi balasOtomatisPelanggan
            });
          });
        });
      }
    }
  }

  String balasOtomatisPenjual(String pesan) {
    // Contoh implementasi sederhana: penjual membalas dengan pesan default
    return "Terima kasih telah menghubungi kami. Ada yang bisa kami bantu lagi?";
  }

  String balasOtomatisPelanggan(String pesan) {
    // Periksa kata kunci dan balas sesuai dengan template yang sudah ditentukan
    pesan = pesan.toLowerCase();  // Mengubah pesan menjadi lowercase untuk pencocokan kata kunci
    for (String kataKunci in balasanOtomatis.keys) {
      if (pesan.contains(kataKunci)) {  // Jika pesan mengandung kata kunci
        return balasanOtomatis[kataKunci]!;  // Mengembalikan balasan sesuai dengan kata kunci
      }
    }
    return "Terima kasih atas pesan Anda!";  // Balasan default jika tidak ada kata kunci yang cocok
  }

  Widget buildPesan(Map<String, String> pesan) {
    bool isPenjual = pesan["role"] == "penjual";  // Menentukan apakah pesan berasal dari penjual atau pelanggan
    return Align(
      alignment: isPenjual ? Alignment.centerLeft : Alignment.centerRight,  // Penyesuaian alignment berdasarkan role
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),  // Padding container pesan
        margin: EdgeInsets.symmetric(vertical: 4),  // Margin container pesan
        decoration: BoxDecoration(
          color: isPenjual ? Colors.green[100] : Colors.blue[100],  // Warna background pesan berdasarkan role
          borderRadius: BorderRadius.circular(8),  // BorderRadius untuk sudut rounded
        ),
        child: Column(
          crossAxisAlignment:
              isPenjual ? CrossAxisAlignment.start : CrossAxisAlignment.end,  // Penyesuaian alignment teks
          children: [
            Text(
              isPenjual ? "Penjual" : "Pelanggan",  // Label role (penjual/pelanggan)
              style: TextStyle(
                fontWeight: FontWeight.bold,  // Teks tebal
                color: isPenjual ? Colors.green : Colors.blue,  // Warna teks berdasarkan role
              ),
            ),
            SizedBox(height: 5),  // Spacer vertikal
            Text(
              pesan["text"]!,  // Isi teks pesan
              style: TextStyle(fontSize: 16),  // Ukuran teks pesan
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),  // Judul appBar
        actions: [
          IconButton(
            icon: Icon(Icons.switch_account),  // Ikona untuk berganti user
            onPressed: () {
              setState(() {
                isPenjual = !isPenjual;  // Toggle antara penjual dan pelanggan
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),  // Padding ListView
              itemCount: pesan.length,  // Jumlah item dalam ListView
              itemBuilder: (context, index) {
                return buildPesan(pesan[index]);  // Memanggil method buildPesan untuk membangun tiap pesan
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),  // Padding untuk input pesan
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: pesanController,  // Menggunakan controller yang telah didefinisikan sebelumnya
                    decoration: InputDecoration(
                      hintText: 'Tulis pesan...',  // Hint teks untuk input pesan
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),  // BorderRadius untuk sudut rounded
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),  // Spacer horizontal
                IconButton(
                  icon: Icon(Icons.send, color: Colors.green),  // Ikona tombol kirim pesan
                  onPressed: kirimPesan,  // Fungsi yang dipanggil ketika tombol ditekan
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
