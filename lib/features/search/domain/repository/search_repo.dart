import 'package:bookly2/core/errors/failure.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:dartz/dartz.dart';

abstract class searchrepo {
  Future<Either<failure, List<booksentity>>> fetchrelevantbooks(
      {String searchname});
}
