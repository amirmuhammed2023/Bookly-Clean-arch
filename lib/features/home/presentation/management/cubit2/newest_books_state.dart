part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksloading extends NewestBooksState {}

final class NewestBooksloadingpagination extends NewestBooksState {}

final class NewestBooksfailure extends NewestBooksState {
  final String errormessage;

  NewestBooksfailure(this.errormessage);
}

final class NewestBooksfailurepagination extends NewestBooksState {
  final String errormessage;

  NewestBooksfailurepagination(this.errormessage);
}

final class NewestBookssuccess extends NewestBooksState {
  final List<booksentity> books;

  NewestBookssuccess(this.books);
}
