import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutteranimationdemo/models/Book.dart';

class FileReader {
  final String path;

  FileReader(this.path);

  Future<Map<String, dynamic>> loadJsonAsset() async {
    String jsonString = await rootBundle.loadString(path);
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  Future<List<Book>> getBooks() async {
    final data = await loadJsonAsset();
    if (data.containsKey('books') && data['books'] is List) {
      return (data['books'] as List)
          .map((item) => Book.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      return [];
    }
  }
}