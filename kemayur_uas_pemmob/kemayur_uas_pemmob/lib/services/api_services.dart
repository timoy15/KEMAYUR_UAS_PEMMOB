import 'dart:convert';  // Mengimpor pustaka dart:convert untuk mengonversi objek JSON
import 'package:http/http.dart' as http;  // Mengimpor package http dari http untuk melakukan HTTP requests
import 'package:kemayur_uas_pemmob/models/vegetable.dart';  // Mengimpor model Vegetable untuk representasi data sayuran
import 'package:kemayur_uas_pemmob/models/meal_package.dart';  // Mengimpor model MealPackage untuk representasi data paket makanan

class ApiService {
  static const String baseUrl = 'http://localhost:3000'; // URL base untuk API server, sesuaikan dengan URL server Anda

  // Method untuk mengambil daftar sayuran dari API
  Future<List<Vegetable>> fetchVegetables() async {
    final response = await http.get(Uri.parse('$baseUrl/vegetables'));  // Melakukan HTTP GET request untuk mendapatkan data sayuran
    if (response.statusCode == 200) {  // Jika response status code adalah 200 (OK)
      Iterable list = json.decode(response.body);  // Decode response body JSON menjadi Iterable
      return list.map((model) => Vegetable.fromJson(model)).toList();  // Mapping data JSON menjadi objek Vegetable dan mengembalikannya sebagai list
    } else {  // Jika request gagal atau response status code bukan 200
      throw Exception('Failed to load vegetables');  // Melakukan throw Exception dengan pesan error
    }
  }

  // Method untuk mengambil daftar paket makanan dari API
  Future<List<MealPackage>> fetchMealPackages() async {
    final response = await http.get(Uri.parse('$baseUrl/meal-packages'));  // Melakukan HTTP GET request untuk mendapatkan data paket makanan
    if (response.statusCode == 200) {  // Jika response status code adalah 200 (OK)
      Iterable list = json.decode(response.body);  // Decode response body JSON menjadi Iterable
      return list.map((model) => MealPackage.fromJson(model)).toList();  // Mapping data JSON menjadi objek MealPackage dan mengembalikannya sebagai list
    } else {  // Jika request gagal atau response status code bukan 200
      throw Exception('Failed to load meal packages');  // Melakukan throw Exception dengan pesan error
    }
  }
}