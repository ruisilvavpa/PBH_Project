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
