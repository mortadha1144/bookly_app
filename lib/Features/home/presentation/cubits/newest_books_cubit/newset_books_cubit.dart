import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBoks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold(
      (failure) => emit(NewsetBooksFailure(failure.errMessagel)),
      (books) => emit(NewsetBooksSuccess(books)),
    );
  }
}
