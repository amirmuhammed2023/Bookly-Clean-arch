import 'package:bookly2/core/utils/app_router.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/presentation/views/widgets/book_information.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class listofbookssearched extends StatelessWidget {
  const listofbookssearched({super.key, required this.mysearchedbooks});
  final List<booksentity> mysearchedbooks;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: mysearchedbooks.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .push(approuter.kdetailsview, extra: mysearchedbooks[index]);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: bookinformation(bookdetails: mysearchedbooks[index]),
            ),
          );
        });
  }
}
