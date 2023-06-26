import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomBookImage(imageUrl: "http://books.google.com/books/content?id=_4dRAAAAMAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
