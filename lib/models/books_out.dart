class BooksOut {
  int bookId;
  String title;
  int category;
  String description;
  double mediaRating;
  int goal;
  int userId;
  int institutionId;
  String? imagePath;

  BooksOut(
      {required this.bookId,
      required this.title,
      required this.category,
      required this.description,
      required this.mediaRating,
      required this.goal,
      required this.userId,
      required this.institutionId,
      this.imagePath});

  factory BooksOut.fromJson(Map<String, dynamic> json) {
    return BooksOut(
        bookId: json['book_Id'],
        title: json['title'],
        category: json['category'],
        description: json['description'],
        mediaRating: json['media_Rating'].toDouble(),
        goal: json['goal'],
        userId: json['user_Id'],
        institutionId: json['institution_Id'],
        imagePath: json['imagePath']);
  }
}
