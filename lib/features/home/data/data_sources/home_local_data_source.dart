import 'package:bookly2/constants.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:hive/hive.dart';

abstract class homelocaldatasource {
  List<booksentity> fetchallbooks({int pagenumber = 0});
  List<booksentity> fetchnewestbooks({int pagenumber = 0});
}

class homelocaldatasourceimpl extends homelocaldatasource {
  @override
  List<booksentity> fetchallbooks({int pagenumber = 0}) {
    var box = Hive.box<booksentity>(kfeaturedbox);
    int startindex = pagenumber * 10;
    int endindex = (pagenumber + 1) * 10;
    int boxlength = box.values.length;
    if (startindex >= boxlength || endindex > boxlength) {
      return [];
    }
    return box.values.toList().sublist(startindex, endindex);
  }

  @override
  List<booksentity> fetchnewestbooks({int pagenumber = 0}) {
    var box = Hive.box<booksentity>(knewestbox);
    int startindex = pagenumber * 10;
    int endindex = (pagenumber + 1) * 10;
    int boxlength = box.values.length;
    if (startindex >= boxlength || endindex > boxlength) {
      return [];
    }
    return box.values.toList().sublist(startindex, endindex);
  }
}
