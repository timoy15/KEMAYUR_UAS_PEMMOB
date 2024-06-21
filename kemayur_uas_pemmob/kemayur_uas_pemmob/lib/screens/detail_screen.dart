import 'package:flutter/material.dart';  // Import library dari Flutter untuk UI
import 'package:provider/provider.dart';  // Import provider untuk manajemen state
import 'cart_provider.dart';  // Import file cart_provider.dart yang berisi provider CartProvider

class DetailPage extends StatefulWidget {
  final dynamic item; // Vegetable or MealPackage, item yang akan ditampilkan detailnya

  const DetailPage({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();  // Membuat stateful widget untuk halaman detail
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;  // Variabel untuk menyimpan jumlah item yang akan dibeli

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,  // Background color dari scaffold adalah hijau
      body: ListView(  // Menggunakan ListView untuk tata letak halaman
        children: [
          const SizedBox(height: 20),  // Spacer vertikal
          header(),  // Memanggil method header untuk bagian atas halaman
          const SizedBox(height: 20),  // Spacer vertikal
          image(),  // Memanggil method image untuk menampilkan gambar
          details(),  // Memanggil method details untuk informasi detail item
        ],
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),  // Padding horizontal untuk row
      child: Row(
        children: [
          Material(
            color: Colors.white.withOpacity(0.3),  // Background material dengan opacity
            borderRadius: BorderRadius.circular(8),  // BorderRadius untuk sudut rounded
            child: const BackButton(color: Colors.white),  // Tombol kembali dengan ikon panah putih
          ),
          const Spacer(),  // Spacer untuk mengisi ruang antara elemen
          Text(
            'Detail Item',  // Judul halaman detail item
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,  // Styling teks judul dengan warna putih
            ),
          ),
          const Spacer(),  // Spacer untuk mengisi ruang antara elemen
          Material(
            color: Colors.white.withOpacity(0.3),  // Background material dengan opacity
            borderRadius: BorderRadius.circular(8),  // BorderRadius untuk sudut rounded
            child: InkWell(
              onTap: () {},  // Fungsi kosong pada tap inkwell
              borderRadius: BorderRadius.circular(8),  // BorderRadius untuk sudut rounded
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                child: const Icon(Icons.favorite_border, color: Colors.white),  // Ikona hati kosong berwarna putih
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget image() {
    return SizedBox(
      width: double.infinity,  // Lebar gambar mengisi layar
      height: 300,  // Tinggi gambar
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 150,  // Tinggi container di bagian bawah
              decoration: const BoxDecoration(
                color: Colors.white,  // Background putih
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),  // BorderRadius untuk sudut rounded
                  topRight: Radius.circular(30),  // BorderRadius untuk sudut rounded
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.green[300]!,  // Shadow berwarna hijau
                    blurRadius: 16,  // Blur radius shadow
                    offset: const Offset(0, 10),  // Offset shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(250),  // BorderRadius untuk sudut rounded
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(250),  // BorderRadius untuk sudut rounded
                child: Image.network(
                  widget.item.imageUrl,  // Memuat gambar dari URL
                  fit: BoxFit.cover,  // Memastikan gambar terisi di kotak
                  width: 250,  // Lebar gambar
                  height: 250,  // Tinggi gambar
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget details() {
    return Container(
      color: Colors.white,  // Background warna putih
      padding: const EdgeInsets.symmetric(horizontal: 16),  // Padding horizontal
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,  // Mengatur tata letak kolom
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,  // Mengatur tata letak kolom
                  children: [
                    Text(
                      widget.item.name,  // Nama item
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,  // Teks tebal
                        color: Colors.black,  // Warna teks hitam
                        fontSize: 34,  // Ukuran teks
                      ),
                    ),
                    Text('Rp ${widget.item.price}',  // Harga item
                      style: const TextStyle(
                        fontSize: 24,  // Ukuran teks
                        fontWeight: FontWeight.bold,  // Teks tebal
                        color: Colors.green,  // Warna teks hijau
                      )),
                  ],
                ),
              ),
              Material(
                color: Colors.green,  // Background warna hijau
                borderRadius: BorderRadius.circular(30),  // BorderRadius untuk sudut rounded
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity -= 1;  // Mengurangi jumlah item
                          });
                          Provider.of<CartProvider>(context, listen: false)
                            .updateQuantity(widget.item, quantity);  // Memperbarui jumlah item di keranjang
                        }
                      },
                      icon: const Icon(Icons.remove, color: Colors.white),  // Ikona tombol kurang
                    ),
                    const SizedBox(width: 4),  // Spacer horizontal
                    Text(
                      '$quantity',  // Jumlah item yang dipilih
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,  // Warna teks putih
                      ),
                    ),
                    const SizedBox(width: 4),  // Spacer horizontal
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity += 1;  // Menambah jumlah item
                        });
                        Provider.of<CartProvider>(context, listen: false)
                          .updateQuantity(widget.item, quantity);  // Memperbarui jumlah item di keranjang
                      },
                      icon: const Icon(Icons.add, color: Colors.white),  // Ikona tombol tambah
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),  // Spacer vertikal
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),  // Ikona bintang berwarna kuning
              const SizedBox(width: 4),  // Spacer horizontal
              Text(
                widget.item.rating.toString(),  // Rating item dalam bentuk teks
                style: const TextStyle(
                  fontSize: 16,  // Ukuran teks
                  fontWeight: FontWeight.bold,  // Teks tebal
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),  // Spacer vertikal
          Material(
            color: Colors.green,  // Background warna hijau
            borderRadius: BorderRadius.circular(16),  // BorderRadius untuk sudut rounded
            child: InkWell(
              borderRadius: BorderRadius.circular(16),  // BorderRadius untuk sudut rounded
              onTap: () {
                Provider.of<CartProvider>(context, listen: false)
                  .addItem(widget.item);  // Menambahkan item ke keranjang
                Navigator.pushNamed(context, '/cart');  // Navigasi ke halaman keranjang
              },
              child: Container(
                width: double.infinity,  // Lebar container mengisi layar
                padding: const EdgeInsets.symmetric(vertical: 20),  // Padding vertikal
                child: const Text(
                  'Tambah ke Keranjang',  // Teks tombol
                  textAlign: TextAlign.center,  // Penataan teks tengah
                  style: TextStyle(
                    fontSize: 18,  // Ukuran teks
                    color: Colors.white,  // Warna teks putih
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),  // Spacer vertikal
        ],
      ),
    );
  }
}
