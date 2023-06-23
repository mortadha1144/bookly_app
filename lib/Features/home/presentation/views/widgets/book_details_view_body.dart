import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

import 'custom_book_details_app_bar.dart';

class BookDeatilsView extends StatelessWidget {
  const BookDeatilsView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .18),
            child: const CustomBookImage(),
          ),
        ],
      ),
    );
  }
}
