import 'package:flutter/material.dart';  // Mengimpor paket flutter untuk pengembangan aplikasi UI
import 'package:kemayur_uas_pemmob/screens/cart_provider.dart';  // Mengimpor file CartProvider yang berisi logika pengelolaan keranjang belanja
import 'package:kemayur_uas_pemmob/screens/cart_screen.dart';  // Mengimpor file CartScreen yang menampilkan isi dari keranjang belanja
import 'package:kemayur_uas_pemmob/screens/home_screen.dart';  // Mengimpor file HomeScreen yang menampilkan halaman utama aplikasi
import 'package:kemayur_uas_pemmob/screens/profile_screen.dart';  // Mengimpor file ProfileScreen yang menampilkan halaman profil pengguna
import 'package:kemayur_uas_pemmob/screens/search_screen.dart';  // Mengimpor file SearchScreen yang menampilkan halaman pencarian produk

import 'package:kemayur_uas_pemmob/screens/payment_screen.dart';  // Mengimpor file PaymentScreen yang menampilkan halaman pembayaran
import 'package:kemayur_uas_pemmob/screens/splash_screen.dart';  // Mengimpor file SplashScreen yang menampilkan layar awal aplikasi
import 'package:kemayur_uas_pemmob/screens/login_screen.dart';  // Mengimpor file LoginScreen yang menampilkan halaman login
import 'package:kemayur_uas_pemmob/screens/register_screen.dart';  // Mengimpor file RegisterScreen yang menampilkan halaman registrasi
import 'package:kemayur_uas_pemmob/screens/chat_screen.dart';  // Mengimpor file ChatScreen yang menampilkan layar obrolan

import 'package:provider/provider.dart';  // Mengimpor paket provider untuk pengelolaan state

void main() {
  runApp(KemaYuRApp());  // Fungsi main untuk menjalankan aplikasi Flutter dengan widget KemaYuRApp sebagai root
}

class KemaYuRApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),  // Membuat provider CartProvider untuk mengelola state keranjang belanja
      child: MaterialApp(
        title: 'KemaYuR',  // Judul aplikasi Flutter
        theme: ThemeData(
          primarySwatch: Colors.green,  // Mengatur warna tema utama aplikasi
        ),
        initialRoute: '/',  // Route awal ketika aplikasi pertama kali dijalankan adalah SplashScreen
        routes: {
          '/': (context) => SplashScreen(),  // Route untuk SplashScreen
          '/home': (context) => HomeScreen(),  // Route untuk HomeScreen
          '/profile': (context) => ProfileScreen(),  // Route untuk ProfileScreen
          '/cart': (context) => CartScreen(),  // Route untuk CartScreen
          '/payment': (context) => PaymentScreen(),  // Route untuk PaymentScreen
          
          '/search': (context) => SearchScreen(items: []),  // Route untuk SearchScreen dengan parameter items kosong
          '/chat': (context) => ChatScreen(),  // Route untuk ChatScreen
          '/login': (context) => LoginScreen(),  // Route untuk LoginScreen
          '/signup': (context) => RegisterScreen(),  // Route untuk RegisterScreen
          '/wishlist': (context) => WishlistScreenWithState(),  // Route untuk WishlistScreenWithState (versi stateful)
        },
      ),
    );
  }
}

class WishlistScreenWithState extends StatefulWidget {
  @override
  _WishlistScreenWithStateState createState() => _WishlistScreenWithStateState();
}

class _WishlistScreenWithStateState extends State<WishlistScreenWithState> {
  List<Item> wishlistItems = [
    Item('Item 1'),
    Item('Item 2'),
    Item('Item 3'),
  ];

  void removeItem(Item item) {
    setState(() {
      wishlistItems.remove(item);  // Menghapus item dari wishlistItems
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),  // Judul halaman WishlistScreen
      ),
      body: ListView.builder(
        itemCount: wishlistItems.length,  // Jumlah item yang ditampilkan dalam ListView
        itemBuilder: (context, index) {
          final item = wishlistItems[index];
          return ListTile(
            title: Text(item.name),  // Menampilkan nama item pada ListTile
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),  // Icon untuk menghapus item dari wishlist
              onPressed: () => removeItem(item),  // Fungsi untuk menghapus item saat icon di-tap
            ),
          );
        },
      ),
    );
  }
}

class Item {
  final String name;

  Item(this.name);  // Konstruktor untuk membuat objek Item dengan nama
}