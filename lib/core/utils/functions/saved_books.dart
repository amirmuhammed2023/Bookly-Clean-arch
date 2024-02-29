import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:hive/hive.dart';

void savedbooksinlocal(List<booksentity> book, String boxname) {
  var box = Hive.box<booksentity>(boxname);
  box.addAll(book);
}
