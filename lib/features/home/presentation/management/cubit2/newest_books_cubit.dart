import 'package:bloc/bloc.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/domain/use_cases/fetch_newest_books_usecases.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestbooks) : super(NewestBooksInitial());
  final fetchnewestbooksusecases newestbooks;
  Future<void> fetchnewestbooks({int pagenumber = 0}) async {
    if (pagenumber == 0) {
      emit(NewestBooksloading());
    }
    emit(NewestBooksloadingpagination());
    var result = await newestbooks.call(pagenumber);
    result.fold(
      (l) {
        if (pagenumber == 0) {
          emit(NewestBooksfailure(l.errmessage));
        } else {
          emit(NewestBooksfailurepagination(l.errmessage));
        }
      },
      (r) {
        emit(NewestBookssuccess(r));
      },
    );
  }
}
