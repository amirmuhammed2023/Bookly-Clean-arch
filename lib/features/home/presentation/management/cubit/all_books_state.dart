part of 'all_books_cubit.dart';

@immutable
sealed class AllBooksState {}

final class AllBooksInitial extends AllBooksState {}

final class AllBooksloading extends AllBooksState {}

final class AllBooksloadingpagination extends AllBooksState {}

final class AllBooksfailure extends AllBooksState {
  final String errormessage;

  AllBooksfailure(this.errormessage);
}

final class AllBooksfailureoagination extends AllBooksState {
  final String errormessage;

  AllBooksfailureoagination(this.errormessage);
}

final class AllBookssuccess extends AllBooksState {
  final List<booksentity> books;

  AllBookssuccess(this.books);
}
