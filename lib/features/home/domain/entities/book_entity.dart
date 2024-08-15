class BookEntity {
  int? BookId;
  String? image;
  String? title;
  String? authorName;
  num? rating;
  num? price;

  BookEntity(
      {required this.image,
      required this.title,
      required this.authorName,
      required this.rating,
      required this.price,
      required this.BookId});
}
