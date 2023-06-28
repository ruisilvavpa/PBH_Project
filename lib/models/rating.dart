class Rating {
  double? rating;
  String? comment;
  int book_Id;

  Rating({
    required this.rating,
    this.comment,
    required this.book_Id,
  });

  Map<String, dynamic> toJson() {
    return {
      'rating': rating?.toDouble(),
      'comment': comment,
      'book_Id': book_Id,
    };
  }
}
