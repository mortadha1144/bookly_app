import 'package:bookly_app/Features/home/presentation/cubits/similar_books_cubit/similar_books_cubit_cubit.dart';
import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksCubitState>(
      builder: (context, state) => state is SimilarBooksCubitSuccess
          ? SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              '',
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            )
          : state is SimilarBooksCubitFailure
              ? CustomeErrorWidget(errorMessage: state.errorMessage)
              : const CustomLoadingIndicator(),
    );
  }
}
