import 'package:bookly2/core/errors/failure.dart';
import 'package:bookly2/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly2/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class homerepoimpl extends homerepo {
  final homeremotedatasource homeremotedata;
  final homelocaldatasource homelocaldata;

  homerepoimpl(this.homeremotedata, this.homelocaldata);
  @override
  Future<Either<failure, List<booksentity>>> fetchallbooks(
      {int pagenumber = 0}) async {
    try {
      List<booksentity> allbooks;
      allbooks = homelocaldata.fetchallbooks(pagenumber: pagenumber);
      if (allbooks.isNotEmpty) {
        return right(allbooks);
      }
      allbooks = await homeremotedata.fetchallbooks(pagenumber: pagenumber);
      return right(allbooks);
    } catch (e) {
      if (e is DioException) {
        return left(serverfailure.fromDioError(e));
      }
      return left(serverfailure(e.toString()));
    }
  }

  @override
  Future<Either<failure, List<booksentity>>> fetchnewestbooks(
      {int pagenumber = 0}) async {
    try {
      List<booksentity> newestbooks;
      newestbooks = homelocaldata.fetchnewestbooks();
      if (newestbooks.isNotEmpty) {
        return right(newestbooks);
      }
      newestbooks =
          await homeremotedata.fetchnewestbooks(pagenumber: pagenumber);
      return right(newestbooks);
    } catch (e) {
      if (e is DioException) {
        return left(serverfailure.fromDioError(e));
      }
      return left(serverfailure(e.toString()));
    }
  }
}
