part of 'searched_books_cubit.dart';

class SearchedBooksState {}

final class SearchedBooksInitial extends SearchedBooksState {}

final class SearchedBooksloading extends SearchedBooksState {}

final class SearchedBooksfailure extends SearchedBooksState {
  final String errmessage;

  SearchedBooksfailure(this.errmessage);
}

final class SearchedBookssuccess extends SearchedBooksState {
  final List<booksentity> books;

  SearchedBookssuccess(this.books);
}

final class SearchedBooksempty extends SearchedBooksState {}
