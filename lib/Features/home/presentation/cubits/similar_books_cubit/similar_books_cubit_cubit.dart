import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'similar_books_cubit_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksCubitState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksCubitInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksCubitLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold(
      (failure) => emit(SimilarBooksCubitFailure(failure.errMessagel)),
      (books) => emit(SimilarBooksCubitSuccess(books)),
    );
  }
}
