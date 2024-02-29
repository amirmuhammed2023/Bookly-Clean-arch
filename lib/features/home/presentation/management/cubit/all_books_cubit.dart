import 'package:bloc/bloc.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/domain/use_cases/fetch_all_books_usecases.dart';
import 'package:meta/meta.dart';

part 'all_books_state.dart';

class AllBooksCubit extends Cubit<AllBooksState> {
  AllBooksCubit(this.allbooks) : super(AllBooksInitial());
  final fetchallbooksusecases allbooks;
  Future<void> fetchallbooks({int pagenumber = 0}) async {
    if (pagenumber == 0) {
      emit(AllBooksloading());
    }
    emit(AllBooksloadingpagination());
    var result = await allbooks.call(pagenumber);
    result.fold(
      (l) {
        if (pagenumber == 0) {
          emit(AllBooksfailure(l.errmessage));
        } else {
          emit(AllBooksfailureoagination(l.errmessage));
        }
      },
      (r) {
        emit(AllBookssuccess(r));
      },
    );
  }
}
