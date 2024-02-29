import 'package:bookly2/core/utils/app_styles.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/presentation/views/widgets/list_of_bookslikealso_bloc.dart';
import 'package:flutter/material.dart';

class sectiondetailslistlike extends StatelessWidget {
  const sectiondetailslistlike({super.key, required this.bookdetails});
  final booksentity bookdetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like",
          style: appstyles.text16.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 16),
        listofbookslikealsobloc(bookdetails: bookdetails)
        //listofbookslikealso(bookdetails: bookdetails)
      ],
    );
  }
}
