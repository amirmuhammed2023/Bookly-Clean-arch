import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/presentation/management/cubit/all_books_cubit.dart';
import 'package:bookly2/features/home/presentation/views/widgets/list_of_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class listofbooksbloc extends StatefulWidget {
  const listofbooksbloc({super.key});

  @override
  State<listofbooksbloc> createState() => _listofbooksblocState();
}

class _listofbooksblocState extends State<listofbooksbloc> {
  List<booksentity> allbookspagination = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllBooksCubit, AllBooksState>(
      listener: (context, state) {
        if (state is AllBookssuccess) {
          allbookspagination.addAll(state.books);
        } else if (state is AllBooksfailureoagination) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errormessage)),
          );
        }
      },
      builder: (context, state) {
        if (state is AllBookssuccess ||
            state is AllBooksloadingpagination ||
            state is AllBooksfailureoagination) {
          return listofbooks(mybooks: allbookspagination);
        } else if (state is AllBooksfailure) {
          return Text(state.errormessage);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
