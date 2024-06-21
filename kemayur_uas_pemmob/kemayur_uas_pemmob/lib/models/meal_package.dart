class MealPackage {
  final dynamic id; // Identifier unik, bisa berupa tipe data apa saja
  final String name; // Nama paket makanan
  final String imageUrl; // URL gambar paket makanan
  final double price; // Harga paket makanan
  final double rating; // Rating paket makanan

  // Konstruktor untuk inisialisasi objek MealPackage
  MealPackage({
    required this.id, // Parameter wajib, digunakan untuk identifier
    required this.name, // Parameter wajib, nama paket makanan
    required this.imageUrl, // Parameter wajib, URL gambar paket makanan
    required this.price, // Parameter wajib, harga paket makanan
    required this.rating, // Parameter wajib, rating paket makanan
  });

  // Factory method untuk membuat objek MealPackage dari JSON
  factory MealPackage.fromJson(Map<String, dynamic> json) {
    return MealPackage(
      id: json['id'], // Mengambil nilai 'id' dari map JSON dan menetapkannya ke dalam id objek MealPackage
      name: json['name'], // Mengambil nilai 'name' dari map JSON dan menetapkannya ke dalam name objek MealPackage
      imageUrl: json['imageUrl'], // Mengambil nilai 'imageUrl' dari map JSON dan menetapkannya ke dalam imageUrl objek MealPackage
      price: json['price'].toDouble(), // Mengambil nilai 'price' dari map JSON, mengonversi ke double, dan menetapkannya ke dalam price objek MealPackage
      rating: json['rating'].toDouble(), // Mengambil nilai 'rating' dari map JSON, mengonversi ke double, dan menetapkannya ke dalam rating objek MealPackage
    );
  }
}
