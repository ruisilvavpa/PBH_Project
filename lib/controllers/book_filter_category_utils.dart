import '../models/books.dart';

class BookFilterByCategory {
  static List<BooksOut> filterBooksByCategory(
      List<BooksOut> tofilter, int categoryId) {
    return tofilter.where((book) => book.categoryId == categoryId).toList();
  }
}
