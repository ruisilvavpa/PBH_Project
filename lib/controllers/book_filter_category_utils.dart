import '../models/books_out.dart';

class BookFilterByCategory {
  static List<BooksOut> filterBooksByCategory(
      List<BooksOut> tofilter, int categoryId) {
    return tofilter.where((book) => book.category == categoryId).toList();
  }
}
