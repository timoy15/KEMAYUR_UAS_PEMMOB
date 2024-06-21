// item_model.dart

// Mendefinisikan kelas Item untuk merepresentasikan sebuah barang dengan nama dan harga.
class Item {
  final String name; // Variabel untuk menyimpan nama barang
  final double price; // Variabel untuk menyimpan harga barang

  // Konstruktor untuk inisialisasi objek Item dengan parameter wajib name dan price.
  Item({required this.name, required this.price});
}
