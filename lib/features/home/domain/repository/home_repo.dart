import 'package:bookly2/core/errors/failure.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:dartz/dartz.dart';

abstract class homerepo {
  Future<Either<failure, List<booksentity>>> fetchallbooks(
      {int pagenumber = 0});
  Future<Either<failure, List<booksentity>>> fetchnewestbooks(
      {int pagenumber = 0});
}
