import 'package:bookly2/features/search/presentation/management/cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customtextformfield extends StatefulWidget {
  const customtextformfield({super.key});

  @override
  State<customtextformfield> createState() => _customtextformfieldState();
}

class _customtextformfieldState extends State<customtextformfield> {
  late TextEditingController controlltext;
  @override
  void initState() {
    controlltext = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controlltext.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return TextField(
      controller: controlltext,
      onSubmitted: (value) {
        controlltext.text = value;
        if (value.isNotEmpty) {
          BlocProvider.of<SearchedBooksCubit>(context)
              .fetchsearchedbooks(value);
        } else {
          BlocProvider.of<SearchedBooksCubit>(context).emptysearched();
        }
      },
      decoration: InputDecoration(
        hintText: "Search",
        suffixIcon: IconButton(
            onPressed: () {
              controlltext.clear();
            },
            icon: Icon(Icons.close, color: Colors.red[400])),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white24),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white24),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
