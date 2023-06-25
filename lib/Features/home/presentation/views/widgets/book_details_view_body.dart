import 'package:flutter/material.dart';

import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_section.dart';

class BookDeatilsView extends StatelessWidget {
  const BookDeatilsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),
                BookDetailsSection(),
                Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SimilarBooksSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}




