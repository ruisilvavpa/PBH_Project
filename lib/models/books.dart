class BooksIn {
  final String title;
  final int categoryId;
  final String description;
  final double mediaRating;
  final int goal;
  final int institutionId;

  BooksIn({
    required this.title,
    required this.categoryId,
    required this.description,
    required this.mediaRating,
    required this.goal,
    required this.institutionId,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category_Id': categoryId,
      'description': description,
      'media_Rating': mediaRating,
      'goal': goal,
      'institution_Id': institutionId,
    };
  }
}

class BooksOut {
  final String id;
  final int title;
  final String categoryId;
  final String description;
  final double mediaRating;
  final int goal;
  final int userId;
  final int institutionId;
  final String imagePath;

  BooksOut({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.description,
    required this.mediaRating,
    required this.goal,
    required this.userId,
    required this.institutionId,
    required this.imagePath,
  });

  BooksOut.fromJson(Map<String, dynamic> json)
      : id = json['book_Id'],
        title = json['title'],
        categoryId = json['category'],
        description = json['description'],
        mediaRating = json['media_Rating'],
        goal = json['goal'],
        userId = json['user_Id'],
        institutionId = json['institution_Id'],
        imagePath = json['imagePath'];

  Map<String, dynamic> toJson() {
    return {
      'book_Id': id,
      'title': title,
      'category_Id': categoryId,
      'description': description,
      'media_Rating': mediaRating,
      'goal': goal,
      'user_Id': userId,
      'institution_Id': institutionId,
      'imagePath': imagePath,
    };
  }
}
