import 'package:flutter/material.dart';  // Import library dari Flutter untuk UI
import 'package:kemayur_uas_pemmob/screens/payment_screen.dart';  // Import screen PaymentScreen
import 'package:provider/provider.dart';  // Import provider untuk state management
import 'cart_provider.dart';  // Import class CartProvider dari file cart_provider.dart

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);  // Menggunakan Provider untuk mendapatkan instance dari CartProvider

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),  // Judul pada AppBar
      ),
      body: cartProvider.items.isEmpty  // Mengecek apakah keranjang belanja kosong
          ? Center(
              child: Text('Keranjang Belanja Kosong'),  // Tampilan jika keranjang belanja kosong
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Jumlah Barang: ${cartProvider.itemCount}',  // Menampilkan jumlah barang dalam keranjang
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Harga: Rp ${cartProvider.totalPrice.toStringAsFixed(2)}',  // Menampilkan total harga dengan format dua angka di belakang koma
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),  // Style teks total harga
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.items[index];
                      return CartItemWidget(item: item);  // Memanggil widget CartItemWidget untuk setiap item dalam keranjang
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentScreen()),  // Pindah ke screen PaymentScreen saat tombol Checkout ditekan
                      );
                    },
                    child: Text('Checkout'),  // Teks pada tombol Checkout
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),  // Padding tombol Checkout
                      textStyle: TextStyle(fontSize: 16),  // Style teks pada tombol Checkout
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final dynamic item;  // Deklarasi variabel untuk item dalam keranjang

  const CartItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);  // Menggunakan Provider untuk mendapatkan instance dari CartProvider

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),  // Margin untuk Card item dalam keranjang
      child: ListTile(
        leading: Image.network(item.imageUrl, width: 50, height: 50),  // Menampilkan gambar item dengan imageUrl dari model item
        title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),  // Menampilkan nama item dengan teks tebal
        subtitle: Text('Rp ${item.price.toString()}'),  // Menampilkan harga item
        trailing: QuantityController(  // Widget QuantityController sebagai trailing widget (di sebelah kanan) dalam ListTile
          item: item,
          quantity: cartProvider.items.where((cartItem) => cartItem.name == item.name).length,  // Mendapatkan jumlah item yang sama dalam keranjang
        ),
      ),
    );
  }
}

class QuantityController extends StatelessWidget {
  final dynamic item;  // Deklarasi variabel untuk item
  final int quantity;  // Deklarasi variabel untuk jumlah item

  const QuantityController({Key? key, required this.item, required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);  // Menggunakan Provider untuk mendapatkan instance dari CartProvider

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.remove_circle, color: Colors.red),  // Icon untuk menghapus item dari keranjang
          onPressed: () {
            cartProvider.removeItem(item);  // Memanggil method removeItem dari CartProvider saat tombol ditekan
          },
        ),
        Text('$quantity'),  // Menampilkan jumlah item
        IconButton(
          icon: Icon(Icons.add_circle, color: Colors.green),  // Icon untuk menambah item ke keranjang
          onPressed: () {
            cartProvider.addItem(item);  // Memanggil method addItem dari CartProvider saat tombol ditekan
          },
        ),
      ],
    );
  }
}
