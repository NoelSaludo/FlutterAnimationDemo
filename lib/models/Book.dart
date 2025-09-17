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

  // sample book data for demo
  static List<Book> getSampleBooks() {
    return [
      Book(
        id: '1',
        title: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        description: 'A classic American novel set in the Jazz Age, following the mysterious Jay Gatsby and his obsession with the beautiful Daisy Buchanan. This masterpiece explores themes of wealth, love, and the American Dream.',
        coverImageUrl: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=300&h=400&fit=crop',
        publishedDate: DateTime(1925),
      ),
      Book(
        id: '2',
        title: 'To Kill a Mockingbird',
        author: 'Harper Lee',
        description: 'A gripping tale of racial injustice and childhood innocence in the American South. Through the eyes of Scout Finch, we witness her father\'s courageous defense of a black man falsely accused of rape.',
        coverImageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=400&fit=crop',
        publishedDate: DateTime(1960),
      ),
      Book(
        id: '3',
        title: '1984',
        author: 'George Orwell',
        description: 'A dystopian masterpiece that explores totalitarianism, surveillance, and the manipulation of truth. Winston Smith\'s struggle against the oppressive Party in a world where Big Brother is always watching.',
        coverImageUrl: 'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=300&h=400&fit=crop',
        publishedDate: DateTime(1949),
      ),
      Book(
        id: '4',
        title: 'Pride and Prejudice',
        author: 'Jane Austen',
        description: 'A timeless romance novel that follows Elizabeth Bennet and Mr. Darcy through their journey of love, misunderstanding, and personal growth in Regency England.',
        coverImageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=300&h=400&fit=crop',
        publishedDate: DateTime(1813),
      ),
      Book(
        id: '5',
        title: 'The Catcher in the Rye',
        author: 'J.D. Salinger',
        description: 'A coming-of-age story following Holden Caulfield as he navigates adolescence, alienation, and the transition to adulthood in 1950s New York.',
        coverImageUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=400&fit=crop',
        publishedDate: DateTime(1951),
      ),
      Book(
        id: '6',
        title: 'Lord of the Flies',
        author: 'William Golding',
        description: 'A powerful allegory about civilization and savagery, following a group of British boys stranded on an uninhabited island and their disastrous attempt to govern themselves.',
        coverImageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=400&fit=crop',
        publishedDate: DateTime(1954),
      ),
    ];
  }

}
