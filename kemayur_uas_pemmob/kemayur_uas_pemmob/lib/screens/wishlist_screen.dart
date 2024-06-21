import 'package:flutter/material.dart';

// Widget untuk menampilkan layar Wishlist
class WishlistScreen extends StatefulWidget {
  final List<dynamic> wishlistItems;  // Daftar produk di wishlist
  final Function(dynamic) onRemoveItem;  // Callback untuk menghapus item dari wishlist

  WishlistScreen({required this.wishlistItems, required this.onRemoveItem});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),  // Judul halaman
        backgroundColor: Colors.red,  // Warna latar belakang app bar
      ),
      body: widget.wishlistItems.isEmpty
          ? Center(
              child: Text(
                'Belum ada produk yang ditambahkan.',  // Pesan jika wishlist kosong
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: widget.wishlistItems.length,  // Jumlah item di wishlist
              itemBuilder: (context, index) {
                final item = widget.wishlistItems[index];  // Mengambil item dari wishlist
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),  // Padding untuk card
                  elevation: 5,  // Elevation (bayangan) untuk card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),  // Bentuk card dengan border radius
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        item.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(item.name),  // Judul item
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rp ${item.price.toString()}',  // Harga item
                            style: TextStyle(color: Colors.green)),
                        SizedBox(height: 5),
                        Row(
                          children: List.generate(5, (i) {
                            return Icon(
                              i < item.rating
                                  ? Icons.star  // Bintang terisi untuk rating
                                  : Icons.star_border,  // Bintang kosong untuk rating
                              size: 16,
                              color: Colors.yellow,
                            );
                          }),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),  // Icon hapus item dari wishlist
                      onPressed: () {
                        setState(() {
                          widget.wishlistItems.removeAt(index);  // Menghapus item dari wishlist
                        });
                        widget.onRemoveItem(item);  // Memanggil callback untuk menghapus item dari state utama
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// Example Home Page with wishlist update functionality
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> wishlistItems = [];  // Daftar item di wishlist
  List<dynamic> allItems = []; // Ini harus berisi semua item

  // Method untuk menambah atau menghapus item dari wishlist
  void _toggleWishlist(dynamic item) {
    setState(() {
      if (wishlistItems.contains(item)) {
        wishlistItems.remove(item);  // Hapus item dari wishlist jika sudah ada
      } else {
        wishlistItems.add(item);  // Tambahkan item ke wishlist jika belum ada
      }
    });
  }

  // Method untuk menghapus item dari wishlist
  void _removeItemFromWishlist(dynamic item) {
    setState(() {
      wishlistItems.remove(item);  // Hapus item dari wishlist
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),  // Judul halaman
      ),
      body: ListView.builder(
        itemCount: allItems.length,  // Jumlah item yang ditampilkan di halaman utama
        itemBuilder: (context, index) {
          final item = allItems[index];  // Mengambil item dari daftar semua item
          final isInWishlist = wishlistItems.contains(item);  // Menentukan apakah item ada di wishlist

          return ListTile(
            leading: Image.network(
              item.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(item.name),  // Judul item
            subtitle: Text('Rp ${item.price.toString()}'),  // Harga item
            trailing: IconButton(
              icon: Icon(
                isInWishlist ? Icons.favorite : Icons.favorite_border,  // Icon hati terisi atau kosong berdasarkan keberadaan item di wishlist
                color: isInWishlist ? Colors.red : null,  // Warna ikon hati merah jika item ada di wishlist
              ),
              onPressed: () {
                _toggleWishlist(item);  // Menambah atau menghapus item dari wishlist saat tombol diklik
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WishlistScreen(
                wishlistItems: wishlistItems,
                onRemoveItem: (item) {
                  _removeItemFromWishlist(item);  // Menghapus item dari wishlist saat tombol wishlist ditekan
                },
              ),
            ),
          );
        },
        child: Icon(Icons.favorite),  // Icon hati untuk tombol wishlist
        backgroundColor: Colors.red,  // Warna latar belakang tombol wishlist
      ),
    );
  }
}

// Model untuk merepresentasikan sebuah item
class Item {
  final String name;  // Nama item
  final String imageUrl;  // URL gambar item
  final double price;  // Harga item
  final int rating;  // Rating item

  Item({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}