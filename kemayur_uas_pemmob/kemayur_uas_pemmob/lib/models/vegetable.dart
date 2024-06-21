class Vegetable {
  final dynamic id; // Identifier yang unik, bisa berupa tipe data apa saja
  final String name; // Nama sayuran
  final String imageUrl; // URL gambar sayuran
  final double price; // Harga sayuran
  final double rating; // Rating sayuran

  // Konstruktor untuk inisialisasi objek Vegetable
  Vegetable({
    required this.id, // Parameter wajib, digunakan untuk identifier
    required this.name, // Parameter wajib, nama sayuran
    required this.imageUrl, // Parameter wajib, URL gambar sayuran
    required this.price, // Parameter wajib, harga sayuran
    required this.rating, // Parameter wajib, rating sayuran
  });

  // Factory method untuk membuat objek Vegetable dari JSON
  factory Vegetable.fromJson(Map<String, dynamic> json) {
    return Vegetable(
      id: json['id'], // Mengambil nilai 'id' dari map JSON dan menetapkannya ke dalam id objek Vegetable
      name: json['name'], // Mengambil nilai 'name' dari map JSON dan menetapkannya ke dalam name objek Vegetable
      imageUrl: json['imageUrl'], // Mengambil nilai 'imageUrl' dari map JSON dan menetapkannya ke dalam imageUrl objek Vegetable
      price: json['price'].toDouble(), // Mengambil nilai 'price' dari map JSON, mengonversi ke double, dan menetapkannya ke dalam price objek Vegetable
      rating: json['rating'].toDouble(), // Mengambil nilai 'rating' dari map JSON, mengonversi ke double, dan menetapkannya ke dalam rating objek Vegetable
    );
  }
}
