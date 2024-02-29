import 'package:bookly2/features/search/presentation/views/widget/custom_text_form_field.dart';
import 'package:bookly2/features/search/presentation/views/widget/list_of_books_searched_bloc.dart';
import 'package:flutter/material.dart';

class searchviewbody extends StatelessWidget {
  const searchviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(14), child: customtextformfield()),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Searched result",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        SizedBox(height: 15),
        Expanded(child: listofbookssearchedbloc())
      ],
    );
  }
}
