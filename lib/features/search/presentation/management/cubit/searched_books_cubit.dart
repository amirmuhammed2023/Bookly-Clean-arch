import 'package:bloc/bloc.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/search/domain/use_cases/fetch_relevant_books_usecases.dart';
//import 'package:meta/meta.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit(this.searchedbooks) : super(SearchedBooksInitial());
  final fetchrelevantbooksusecases searchedbooks;

  Future<void> fetchsearchedbooks(String booksname) async {
    emit(SearchedBooksloading());
    var result = await searchedbooks.call(booksname);
    result.fold((l) {
      emit(SearchedBooksfailure(l.errmessage));
    }, (r) {
      emit(SearchedBookssuccess(r));
    });
  }

  emptysearched() {
    emit(SearchedBooksempty());
  }
}
