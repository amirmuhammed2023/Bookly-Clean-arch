import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/presentation/views/widgets/section_details_book.dart';
import 'package:bookly2/features/home/presentation/views/widgets/section_details_listlike.dart';
import 'package:flutter/material.dart';

class detailsviewbody extends StatelessWidget {
  const detailsviewbody({super.key, required this.bookschecked});
  final booksentity bookschecked;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                sectiondetailsbook(bookchecked: bookschecked),
                Expanded(child: SizedBox(height: 50)),
                sectiondetailslistlike(bookdetails: bookschecked),
                SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
