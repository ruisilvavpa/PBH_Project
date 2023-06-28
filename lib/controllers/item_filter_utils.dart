import '../models/books_out.dart';
import '../models/items_for_search.dart';

class ItemFilterUtils {
  static List<ItemsForSearch> filterItemsByKeyword(
      List<ItemsForSearch> items, String keyword) {
    return items
        .where(
            (item) => item.title.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}
