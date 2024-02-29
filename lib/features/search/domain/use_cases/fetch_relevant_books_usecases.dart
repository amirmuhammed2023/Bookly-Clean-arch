import 'package:bookly2/core/errors/failure.dart';
import 'package:bookly2/core/use_cases/use_case.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/search/domain/repository/search_repo.dart';
import 'package:dartz/dartz.dart';

class fetchrelevantbooksusecases extends usecase<List<booksentity>, String> {
  final searchrepo searchrepo1;

  fetchrelevantbooksusecases(this.searchrepo1);
  @override
  Future<Either<failure, List<booksentity>>> call([String? param]) async {
    return await searchrepo1.fetchrelevantbooks(searchname: param!);
  }
}
