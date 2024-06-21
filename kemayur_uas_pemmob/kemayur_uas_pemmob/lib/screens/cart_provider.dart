import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<dynamic> _items = [];  // List untuk menyimpan item dalam keranjang

  List<dynamic> get items => _items;  // Getter untuk mendapatkan daftar item dalam keranjang

  // Menambahkan item ke keranjang
  void addItem(dynamic item) {
    _items.add(item);  // Menambahkan item baru ke dalam _items
    notifyListeners();  // Memberitahu listener bahwa terjadi perubahan state
  }

  // Menghapus item dari keranjang
  void removeItem(dynamic item) {
    _items.remove(item);  // Menghapus item dari _items
    notifyListeners();  // Memberitahu listener bahwa terjadi perubahan state
  }

  // Membersihkan keranjang
  void clearCart() {
    _items.clear();  // Mengosongkan _items
    notifyListeners();  // Memberitahu listener bahwa terjadi perubahan state
  }

  // Menghitung jumlah barang di keranjang
  int get itemCount => _items.length;  // Mengembalikan jumlah item dalam _items

  // Menghitung total harga semua barang di keranjang
  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.price;  // Menambahkan harga setiap item ke total
    }
    return total;  // Mengembalikan total harga
  }

  // Memperbarui jumlah barang di keranjang
  void updateQuantity(dynamic item, int newQuantity) {
    // Cari item yang sesuai di dalam keranjang berdasarkan nama
    final existingItem = _items.firstWhere(
      (cartItem) => cartItem.name == item.name,
      orElse: () => null,
    );

    if (existingItem != null) {
      // Update jumlah produk jika ditemukan
      _items[_items.indexOf(existingItem)] = item.copyWith(quantity: newQuantity);  // Mengganti item lama dengan item baru yang memiliki jumlah baru
      notifyListeners();  // Memberitahu listener bahwa terjadi perubahan state
    }
  }
}
