import 'package:hive/hive.dart';
part 'booksentity.g.dart';

@HiveType(typeId: 0)
class booksentity {
  @HiveField(0)
  final String bookid;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? author;
  @HiveField(4)
  final num? rating;
  @HiveField(5)
  final num? price;
  @HiveField(6)
  final String? link;

  booksentity(
      {required this.bookid,
      required this.image,
      required this.title,
      required this.author,
      required this.rating,
      required this.price,
      this.link});
}
