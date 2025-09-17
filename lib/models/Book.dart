import 'package:flutter/cupertino.dart';

class Book {
  final String _id;
  final String _title;
  final String _author;
  final String _description;
  final String _coverImageUrl;
  final DateTime _publishedDate;

  Book({
    required String id,
    required String title,
    required String author,
    required String description,
    required String coverImageUrl,
    required DateTime publishedDate,
  })  : _id = id,
        _title = title,
        _author = author,
        _description = description,
        _coverImageUrl = coverImageUrl,
        _publishedDate = publishedDate;

  String get id => _id;
  String get title => _title;
  String get author => _author;
  String get description => _description;
  String get coverImageUrl => _coverImageUrl;
  DateTime get publishedDate => _publishedDate;

}