import 'package:bookly2/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class usecase<type, parameter> {
  Future<Either<failure, type>> call([parameter param]);
}
