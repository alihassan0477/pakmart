class Review {
  Review(
      {required this.customer_name,
      required this.description,
      required this.rating});

  String customer_name;
  String description;
  int rating;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        customer_name: json["customer_id"]['username'],
        description: json['description'],
        rating: json['rating']);
  }
}
