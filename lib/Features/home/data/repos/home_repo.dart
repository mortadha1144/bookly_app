import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
 Future<Either<Failure,List<BookModel>>> fetchBestSellerBooks();
 Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
}
