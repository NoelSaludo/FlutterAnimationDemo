import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/utils/FileReader.dart';

class Book {
  final String _title;
  final String _author;
  final String _description;
  final String _coverImageUrl;
  final String _publishedDate;
  final double _rating;
  final bool _bestSelling;

  Book({
    required String title,
    required String author,
    required String description,
    required String coverImageUrl,
    required String publishedDate,
    required double rating,
    required bool bestSelling,
  }) : _title = title,
       _author = author,
       _description = description,
       _coverImageUrl = coverImageUrl,
       _publishedDate = publishedDate,
       _rating = rating,
       _bestSelling = bestSelling;

  String get title => _title;

  String get author => _author;

  String get description => _description;

  String get coverImageUrl => _coverImageUrl;

  String get publishedDate => _publishedDate;

  double get rating => _rating;

  bool get bestSelling => _bestSelling;

  Text getItemText() {
    return Text(
      _title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 19),
    );
  }

  Text getAuthorText() {
    return Text(
      _author,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
    );
  }

  Text getDescriptionText() {
    return Text(
      _description.length > 80
          ? '${_description.substring(0, 80)}...'
          : _description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
    );
  }

  // TODO: Clean this up
  // sample book data for demo
  static Future<List<Book>> getSampleBooks() async {
    FileReader fileReader = FileReader('assets/books.json');
    return await fileReader.getBooks();
  }

  Book.fromJson(Map<String, dynamic> json)
    : _title = json['title'] as String,
      _author = json['author'] as String,
      _description = json['description'] as String,
      _coverImageUrl = json['cover_image_url'] as String,
      _publishedDate = json['publication_date'] as String,
      _rating = json['rating'] as double,
      _bestSelling = json['bestselling'] as bool;

  Map<String, dynamic> toJson() {
    return {
      'title': _title,
      'author': _author,
      'description': _description,
      'cover_image_url': _coverImageUrl,
      'publication_date': _publishedDate,
      'rating': _rating,
      'bestselling': _bestSelling,
    };
  }
}
