import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'corona_indonesia.dart'; //dari kelas corona_indonesia.dart

class CoronaProvider with ChangeNotifier {
  corona_indonesia summary; //ambil deklarasi dari kelas di corona_indonesia.dart

  String updated;

  Future<void> getData() async {
    final url = 'https://corona.lmao.ninja/v2/countries/indonesia'; //URL API
    final response = await http.get(url);
    final result = json.decode(response.body) as Map<String, dynamic>;
    summary = corona_indonesia(
      // (deklarasi dari kelas sbelumnya) : result['atribut di API']
      positif: result['cases'],
      sembuh: result['recovered'],
      meninggal: result['deaths'],
      dirawat: result['active'],
    );
  }
}