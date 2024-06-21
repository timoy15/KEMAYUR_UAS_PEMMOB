import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membangun UI
import 'package:provider/provider.dart'; // Mengimpor pustaka provider untuk state management
import 'cart_provider.dart'; // Mengimpor CartProvider untuk mengelola data keranjang

// Definisi kelas PaymentScreen sebagai StatelessWidget
class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan instance CartProvider dari context
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      // Scaffold menyediakan struktur dasar untuk layar aplikasi
      appBar: AppBar(
        title: Text('Payment'), // Judul AppBar
      ),
      body: Container(
        // Dekorasi latar belakang dengan gradien warna hijau
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade400, Colors.green.shade700], // Gradien warna latar belakang
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Menyelaraskan kolom di tengah secara vertikal
            children: [
              Icon(
                Icons.payment, // Ikon pembayaran
                color: Colors.white, // Warna ikon
                size: 80, // Ukuran ikon
              ),
              SizedBox(height: 20), // Jarak vertikal
              Text(
                'Total Amount',
                style: TextStyle(
                  color: Colors.white, // Warna teks
                  fontSize: 24, // Ukuran teks
                ),
              ),
              SizedBox(height: 10), // Jarak vertikal
              Text(
                'Rp ${cartProvider.totalPrice.toStringAsFixed(2)}', // Menampilkan total harga
                style: TextStyle(
                  color: Colors.white, // Warna teks
                  fontSize: 32, // Ukuran teks
                  fontWeight: FontWeight.bold, // Tebal teks
                ),
              ),
              SizedBox(height: 20), // Jarak vertikal
              ElevatedButton(
                onPressed: () {
                  // Simulasi proses pembayaran sukses
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Payment Successful'), // Judul dialog
                      content: Text('Thank you for your purchase!'), // Konten dialog
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Tutup dialog
                            // Navigasi ke halaman purchase setelah pembayaran sukses
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PurchaseScreen(), // Ganti ke halaman PurchaseScreen
                              ),
                            );
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Pay Now'), // Teks pada tombol
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0), // Padding tombol
                  textStyle: TextStyle(fontSize: 16), // Ukuran teks tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Definisi kelas PurchaseScreen sebagai StatefulWidget
class PurchaseScreen extends StatefulWidget {
  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

// State untuk PurchaseScreen
class _PurchaseScreenState extends State<PurchaseScreen> {
  DateTime selectedDate = DateTime.now(); // Tanggal yang dipilih, default adalah sekarang
  TimeOfDay selectedTime = TimeOfDay.now(); // Waktu yang dipilih, default adalah sekarang
  final TextEditingController nameController = TextEditingController(); // Kontroler untuk input nama
  final TextEditingController addressController = TextEditingController(); // Kontroler untuk input alamat
  final TextEditingController phoneController = TextEditingController(); // Kontroler untuk input nomor telepon

  // Fungsi untuk memilih tanggal
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Tanggal awal yang dipilih
      firstDate: DateTime(2021), // Tanggal awal yang bisa dipilih
      lastDate: DateTime(2030), // Tanggal akhir yang bisa dipilih
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked; // Mengatur tanggal yang dipilih
      });
  }

  // Fungsi untuk memilih waktu
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime, // Waktu awal yang dipilih
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked; // Mengatur waktu yang dipilih
      });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context); // Mendapatkan instance CartProvider

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Form'), // Judul AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Padding di sekitar konten
        child: Card(
          elevation: 8.0, // Elevasi kartu
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Radius sudut kartu
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Padding di dalam kartu
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Membuat kolom melar ke seluruh lebar
              children: [
                TextField(
                  controller: nameController, // Kontroler untuk input nama
                  decoration: InputDecoration(
                    labelText: 'Nama', // Label untuk input nama
                    prefixIcon: Icon(Icons.person), // Ikon prefix
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Radius sudut input
                    ),
                  ),
                ),
                SizedBox(height: 20), // Jarak vertikal
                TextField(
                  controller: addressController, // Kontroler untuk input alamat
                  decoration: InputDecoration(
                    labelText: 'Alamat', // Label untuk input alamat
                    prefixIcon: Icon(Icons.home), // Ikon prefix
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Radius sudut input
                    ),
                  ),
                ),
                SizedBox(height: 20), // Jarak vertikal
                TextField(
                  controller: phoneController, // Kontroler untuk input nomor telepon
                  decoration: InputDecoration(
                    labelText: 'Nomor HP', // Label untuk input nomor telepon
                    prefixIcon: Icon(Icons.phone), // Ikon prefix
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), // Radius sudut input
                    ),
                  ),
                ),
                SizedBox(height: 20), // Jarak vertikal
                ListTile(
                  title: Text("Pilih Tanggal: ${selectedDate.toLocal()}".split(' ')[0]), // Menampilkan tanggal yang dipilih
                  trailing: Icon(Icons.calendar_today), // Ikon kalender
                  onTap: () => _selectDate(context), // Memanggil fungsi pilih tanggal saat diketuk
                ),
                SizedBox(height: 20), // Jarak vertikal
                ListTile(
                  title: Text("Pilih Jam: ${selectedTime.format(context)}"), // Menampilkan waktu yang dipilih
                  trailing: Icon(Icons.access_time), // Ikon jam
                  onTap: () => _selectTime(context), // Memanggil fungsi pilih waktu saat diketuk
                ),
                SizedBox(height: 30), // Jarak vertikal
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman struk pembayaran setelah formulir disubmit
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentReceiptScreen(
                          name: nameController.text, // Mengirim nama
                          address: addressController.text, // Mengirim alamat
                          phone: phoneController.text, // Mengirim nomor telepon
                          date: selectedDate, // Mengirim tanggal
                          time: selectedTime, // Mengirim waktu
                          totalPrice: cartProvider.totalPrice, // Mengirim total harga
                        ),
                      ),
                    );
                  },
                  child: Text('Submit'), // Teks pada tombol
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.0), // Padding tombol
                    textStyle: TextStyle(fontSize: 16), // Ukuran teks tombol
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

// Definisi kelas PaymentReceiptScreen sebagai StatelessWidget
class PaymentReceiptScreen extends StatelessWidget {
  final String name;
  final String address;
  final String phone;
  final DateTime date;
  final TimeOfDay time;
  final double totalPrice;

  // Konstruktor untuk PaymentReceiptScreen
  PaymentReceiptScreen({
    required this.name,
    required this.address,
    required this.phone,
    required this.date,
    required this.time,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Receipt'), // Judul AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Padding di sekitar konten
        child: Card(
          elevation: 8.0, // Elevasi kartu
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Radius sudut kartu
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Padding di dalam kartu
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Membuat kolom melar ke seluruh lebar
              children: [
                Center(
                  child: Text(
                    'Payment Receipt', // Teks judul struk pembayaran
                    style: TextStyle(
                      fontSize: 24, // Ukuran teks
                      fontWeight: FontWeight.bold, // Tebal teks
                    ),
                  ),
                ),
                Divider(height: 30, thickness: 2), // Garis pembatas
                Text(
                  'Detail Pembayaran',
                  style: TextStyle(
                    fontSize: 20, // Ukuran teks
                    fontWeight: FontWeight.bold, // Tebal teks
                  ),
                ),
                SizedBox(height: 10), // Jarak vertikal
                Text('Nama: $name', style: TextStyle(fontSize: 16)), // Menampilkan nama
                Text('Alamat: $address', style: TextStyle(fontSize: 16)), // Menampilkan alamat
                Text('Nomor HP: $phone', style: TextStyle(fontSize: 16)), // Menampilkan nomor telepon
                Text('Tanggal: ${date.toLocal()}'.split(' ')[0], style: TextStyle(fontSize: 16)), // Menampilkan tanggal
                Text('Jam: ${time.format(context)}', style: TextStyle(fontSize: 16)), // Menampilkan waktu
                SizedBox(height: 20), // Jarak vertikal
                Text(
                  'Total Harga: Rp ${totalPrice.toStringAsFixed(2)}', // Menampilkan total harga
                  style: TextStyle(
                    fontSize: 20, // Ukuran teks
                    fontWeight: FontWeight.bold, // Tebal teks
                  ),
                ),
                Spacer(), // Spacer untuk mendorong tombol ke bawah
                ElevatedButton(
                  onPressed: () {
                    // Kembali ke halaman utama atau halaman lainnya
                    Navigator.pop(context);
                  },
                  child: Text('OK'), // Teks pada tombol
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.0), // Padding tombol
                    textStyle: TextStyle(fontSize: 16), // Ukuran teks tombol
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