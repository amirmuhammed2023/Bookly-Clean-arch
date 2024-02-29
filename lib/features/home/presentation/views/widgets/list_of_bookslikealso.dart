import 'package:bookly2/core/utils/app_router.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class listofbookslikealso extends StatelessWidget {
  const listofbookslikealso({super.key, required this.bookssimilar});
  final List<booksentity> bookssimilar;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: bookssimilar.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  approuter.kdetailsview,
                  extra: bookssimilar[index],
                );
              },
              child: custombookitem(
                  aspect: 2.6 / 4, imageurl: bookssimilar[index].image ?? ""),
            ),
          );
        },
      ),
    );
  }
}
