import 'dart:convert';

import '../dataClass/dcPost.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<cPost>> getAllData() async {
    final response = await http.get(Uri.parse(
      'https://api-berita-indonesia.vercel.app/cnbc/terbaru/',
    ));
    if (response.statusCode == 200) {
      //error menggunakan map karena tipe List tidak sesuai (memakai statis)
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => cPost.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
