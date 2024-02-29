import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/presentation/views/widgets/list_of_bookslikealso.dart';
import 'package:bookly2/features/search/presentation/management/cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class listofbookslikealsobloc extends StatefulWidget {
  const listofbookslikealsobloc({super.key, required this.bookdetails});
  final booksentity bookdetails;
  @override
  State<listofbookslikealsobloc> createState() =>
      _listofbookslikealsoblocState();
}

class _listofbookslikealsoblocState extends State<listofbookslikealsobloc> {
  void initState() {
    BlocProvider.of<SearchedBooksCubit>(context)
        .fetchsearchedbooks(widget.bookdetails.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBookssuccess) {
          return listofbookslikealso(bookssimilar: state.books);
        } else if (state is SearchedBooksfailure) {
          return Text(state.errmessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
