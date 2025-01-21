import 'package:flutter/material.dart';
import 'package:pakmart/Model/ReviewModel.dart';
import 'package:pakmart/api/ReviewsApi.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key, required this.product_id});

  final String product_id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reviews"),
      ),
      body: FutureBuilder(
          future: ReviewsApi().get_Reviews_by_productId(product_id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error in Fetching "),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text("No Review Found"),
              );
            }

            List<Review> reviews = snapshot.data!;

            return ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.person),
                title: Text(reviews[index].customer_name),
                subtitle: Text(
                  reviews[index].description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                trailing: CustomRatingBar(
                  rating: reviews[index].rating,
                ),
              ),
            );
          }),
    );
  }
}

class CustomRatingBar extends StatelessWidget {
  CustomRatingBar({super.key, required this.rating});

  int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: index < rating ? Colors.amber : Colors.grey,
        ),
      ),
    );
  }
}
