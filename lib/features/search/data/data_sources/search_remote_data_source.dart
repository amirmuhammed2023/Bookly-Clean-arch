import 'package:bookly2/core/utils/api_services.dart';
import 'package:bookly2/features/home/data/model/bookmodel/bookmodel.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';

abstract class searchremotedatasource {
  Future<List<booksentity>> fetchrelevantbooks({String searchname});
}

class searchremotedatasourceimpl extends searchremotedatasource {
  final apiservices apiservices1;

  searchremotedatasourceimpl(this.apiservices1);
  @override
  Future<List<booksentity>> fetchrelevantbooks({String? searchname}) async {
    var data = await apiservices1.get(
        endpoint: "volumes?Filtering=free-ebooks&q=$searchname");
    List<booksentity> searchedbooks = [];
    for (var element in data["items"]) {
      searchedbooks.add(Bookmodel.fromJson(element));
    }
    return searchedbooks;
  }
}
