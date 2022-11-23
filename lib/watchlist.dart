class Watch {
  final bool watched;
  final String title;
  final int rating;
  final DateTime releaseDate;
  final String review;

  const Watch({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  factory Watch.fromJson(Map<String, dynamic> json) {
    return Watch(
      watched: json['watched'],
      title: json['title'],
      rating: json['rating'],
      releaseDate: DateTime.parse(json["release_date"]),
      review: json['review'],
    );
  }
}
