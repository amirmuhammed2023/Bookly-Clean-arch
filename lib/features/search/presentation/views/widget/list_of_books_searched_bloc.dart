import 'package:bookly2/features/search/presentation/management/cubit/searched_books_cubit.dart';
import 'package:bookly2/features/search/presentation/views/widget/image_app.dart';
import 'package:bookly2/features/search/presentation/views/widget/list_of_books_searched.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class listofbookssearchedbloc extends StatelessWidget {
  const listofbookssearchedbloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBookssuccess) {
          return listofbookssearched(mysearchedbooks: state.books);
        } else if (state is SearchedBooksfailure) {
          return Center(
              child: Text(
            state.errmessage,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ));
        } else if (state is SearchedBooksloading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return imageapp();
        }
      },
    );
  }
}
