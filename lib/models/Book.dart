import 'package:flutter/material.dart';

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

  // Returns a styled Text widget for the book title
  Text item() {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 19),
    );
  }

  // Returns a styled Text widget for the book author
  Text authorWidget() {
    return Text(
      author,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
    );
  }

  // Returns a styled Text widget for the book description
  Text descriptionWidget() {
    return Text(
      description.length > 80 ? '${description.substring(0, 80)}...' : description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
    );
  }

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
        coverImageUrl: 'https://images.unsplash.com/photo-1463320898484-cdee8141c787?w=300&h=400&fit=crop',
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
      Book(
        id: '7',
        title: 'Moby-Dick',
        author: 'Herman Melville',
        description: 'The epic tale of Captain Ahab\'s obsessive quest to hunt the white whale, Moby-Dick, exploring themes of fate, revenge, and the human condition.',
        coverImageUrl: 'https://images.unsplash.com/photo-1464983953574-0892a716854b?w=300&h=400&fit=crop',
        publishedDate: DateTime(1851),
      ),
      Book(
        id: '8',
        title: 'Brave New World',
        author: 'Aldous Huxley',
        description: 'A visionary dystopian novel that imagines a future society driven by technological advancements, conformity, and the loss of individuality.',
        coverImageUrl: 'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?w=300&h=400&fit=crop',
        publishedDate: DateTime(1932),
      ),
      Book(
        id: '9',
        title: 'The Hobbit',
        author: 'J.R.R. Tolkien',
        description: 'Bilbo Baggins embarks on a grand adventure with a group of dwarves to reclaim their homeland from the dragon Smaug in this beloved fantasy classic.',
        coverImageUrl: 'https://images.unsplash.com/photo-1507842217343-583bb7270b66?w=300&h=400&fit=crop',
        publishedDate: DateTime(1937),
      ),
      Book(
        id: '10',
        title: 'Jane Eyre',
        author: 'Charlotte Brontë',
        description: 'A groundbreaking novel following the emotional and moral growth of the orphaned Jane Eyre as she navigates love, independence, and social criticism.',
        coverImageUrl: 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=300&h=400&fit=crop',
        publishedDate: DateTime(1847),
      ),
      Book(
        id: '11',
        title: 'Crime and Punishment',
        author: 'Fyodor Dostoevsky',
        description: 'A psychological drama about guilt, redemption, and morality, centered on the troubled student Raskolnikov after he commits a murder.',
        coverImageUrl: 'https://images.unsplash.com/photo-1463320898484-cdee8141c787?w=300&h=400&fit=crop',
        publishedDate: DateTime(1866),
      ),
      Book(
        id: '12', 
        title: 'The Alchemist',
        author: 'Paulo Coelho',
        description: 'A philosophical novel about a young shepherd named Santiago who dreams of finding a worldly treasure and discovers the importance of following one\'s dreams.',
        coverImageUrl: 'https://images.unsplash.com/photo-1463320898484-cdee8141c787?w=300&h=400&fit=crop',
        publishedDate: DateTime(1988),
      ),
    ];
  }

}
