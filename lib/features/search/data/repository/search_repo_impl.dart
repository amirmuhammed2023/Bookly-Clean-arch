import 'package:bookly2/core/errors/failure.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly2/features/search/domain/repository/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class searchrepoimpl extends searchrepo {
  final searchremotedatasource searchremotedata;

  searchrepoimpl(this.searchremotedata);
  @override
  Future<Either<failure, List<booksentity>>> fetchrelevantbooks(
      {String? searchname}) async {
    try {
      List<booksentity> searchedbooks =
          await searchremotedata.fetchrelevantbooks(searchname: searchname!);
      return right(searchedbooks);
    } catch (e) {
      if (e is DioException) {
        return left(serverfailure.fromDioError(e));
      }
      return left(serverfailure(e.toString()));
    }
  }
}
