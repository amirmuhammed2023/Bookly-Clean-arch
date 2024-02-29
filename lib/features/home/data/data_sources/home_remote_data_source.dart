import 'package:bookly2/constants.dart';
import 'package:bookly2/core/utils/api_services.dart';
import 'package:bookly2/core/utils/functions/saved_books.dart';
import 'package:bookly2/features/home/data/model/bookmodel/bookmodel.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';

abstract class homeremotedatasource {
  Future<List<booksentity>> fetchallbooks({int pagenumber = 0});
  Future<List<booksentity>> fetchnewestbooks({int pagenumber = 0});
}

class homeremotedatasourceimpl extends homeremotedatasource {
  final apiservices apiservices1;

  homeremotedatasourceimpl(this.apiservices1);
  @override
  Future<List<booksentity>> fetchallbooks({int pagenumber = 0}) async {
    var data = await apiservices1.get(
        endpoint:
            "volumes?Filtering=free-ebooks&q=Programming&startIndex=${pagenumber * 10}");
    List<booksentity> book = bookslist(data);
    savedbooksinlocal(book, kfeaturedbox);
    return book;
  }

  @override
  Future<List<booksentity>> fetchnewestbooks({int pagenumber = 0}) async {
    var data = await apiservices1.get(
        endpoint:
            "volumes?Filtering=free-ebooks&q=Programming&Sorting=newest&startIndex=${pagenumber * 10}");
    List<booksentity> book = bookslist(data);
    savedbooksinlocal(book, knewestbox);
    return book;
  }

  List<booksentity> bookslist(Map<String, dynamic> data) {
    List<booksentity> book = [];
    for (var element in data["items"]) {
      book.add(Bookmodel.fromJson(element));
    }
    return book;
  }
}
