import 'dart:convert';

import 'package:flutteranimationdemo/models/Book.dart';
import 'package:flutteranimationdemo/utils/FileReader.dart';

void main() {

  FileReader fileReader = FileReader('assets/books.json');
  List<Book> books = fileReader.getBooks();

  for (var book in books) {
    assert(book.title.isNotEmpty);
    assert(book.author.isNotEmpty);
    assert(book.description.isNotEmpty);
    assert(book.coverImageUrl.isNotEmpty);
    assert(book.publishedDate != null);
    assert(book.rating >= 0 && book.rating <= 5);
  }
}