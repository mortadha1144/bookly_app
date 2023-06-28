import 'package:bookly_app/Features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_loading_indicator.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () => GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]),
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              '',
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomeErrorWidget(errorMessage: state.errorMessage);
        }
        return const CustomLoadingIndicator();
      },
    );
  }
}
