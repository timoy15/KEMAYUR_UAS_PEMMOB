import 'package:flutter/material.dart';
import 'detail_screen.dart'; // Mengimpor detail_screen.dart untuk digunakan dalam routing

class SearchScreen extends StatefulWidget {
  final List<dynamic> items; // List items yang digunakan untuk pencarian

  SearchScreen({required this.items}); // Constructor untuk menerima list items

  @override
  _SearchScreenState createState() => _SearchScreenState(); // Mengembalikan _SearchScreenState sebagai state dari SearchScreen
}

class _SearchScreenState extends State<SearchScreen> {
  List<dynamic> filteredItems = []; // List untuk menyimpan hasil pencarian

  // Fungsi untuk melakukan filter items berdasarkan query
  void _filterItems(String query) {
    setState(() {
      filteredItems = widget.items.where((item) {
        final itemName = item.name.toLowerCase(); // Mengambil nama item dalam lowercase
        final input = query.toLowerCase(); // Mengubah query ke lowercase
        return itemName.contains(input); // Mengembalikan true jika nama item mengandung input query
      }).toList(); // Mengubah hasil filter menjadi list
    });
  }

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items; // Menginisialisasi filteredItems dengan semua items saat initState dipanggil
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'), // Judul AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: _filterItems, // Memanggil _filterItems saat nilai TextField berubah
              decoration: InputDecoration(
                hintText: 'Search...', // Hint text pada TextField
                prefixIcon: Icon(Icons.search), // Icon search di sebelah kiri TextField
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // Border radius pada input
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length, // Jumlah item dalam ListView sesuai dengan panjang filteredItems
                itemBuilder: (context, index) {
                  var item = filteredItems[index]; // Mengambil item pada index tertentu dari filteredItems
                  return ListTile(
                    leading: Image.network(
                      item.imageUrl, // URL gambar item
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item.name), // Nama item
                    subtitle: Text('Rp ${item.price}'), // Harga item
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(item: item), // Navigasi ke halaman detail dengan membawa item yang dipilih
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}