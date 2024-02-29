import 'package:bookly2/core/errors/failure.dart';
import 'package:bookly2/core/use_cases/use_case.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

class fetchallbooksusecases extends usecase<List<booksentity>, int> {
  final homerepo homerepo1;

  fetchallbooksusecases(this.homerepo1);

  @override
  Future<Either<failure, List<booksentity>>> call([int param = 0]) async {
    return await homerepo1.fetchallbooks(pagenumber: param);
  }
}
