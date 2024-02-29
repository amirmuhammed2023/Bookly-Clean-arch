import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/presentation/management/cubit2/newest_books_cubit.dart';
import 'package:bookly2/features/home/presentation/views/widgets/list_of_bookinformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class listofbooksinformationbloc extends StatefulWidget {
  const listofbooksinformationbloc({super.key});

  @override
  State<listofbooksinformationbloc> createState() =>
      _listofbooksinformationblocState();
}

class _listofbooksinformationblocState
    extends State<listofbooksinformationbloc> {
  List<booksentity> newestbookspagination = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBookssuccess) {
          newestbookspagination.addAll(state.books);
        } else if (state is NewestBooksfailurepagination) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errormessage)),
          );
        }
      },
      builder: (context, state) {
        if (state is NewestBookssuccess ||
            state is NewestBooksloadingpagination ||
            state is NewestBooksfailurepagination) {
          return listofbookinformation(mynewestbooks: newestbookspagination);
        } else if (state is NewestBooksfailure) {
          return Text(state.errormessage);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
