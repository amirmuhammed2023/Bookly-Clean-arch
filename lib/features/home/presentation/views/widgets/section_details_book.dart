import 'package:bookly2/constants.dart';
import 'package:bookly2/core/utils/app_styles.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly2/features/home/presentation/views/widgets/buttons_book.dart';
import 'package:bookly2/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly2/features/home/presentation/views/widgets/custom_details_appbar.dart';
import 'package:flutter/material.dart';

class sectiondetailsbook extends StatelessWidget {
  const sectiondetailsbook({super.key, required this.bookchecked});
  final booksentity bookchecked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        customdetailsappbar(),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.18),
          child: custombookitem(
              aspect: 2.6 / 4, imageurl: bookchecked.image ?? ""),
        ),
        SizedBox(height: 40),
        Text(
          bookchecked.title,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: appstyles.text20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 3),
        Text(
          bookchecked.author ?? "",
          style: appstyles.text16
              .copyWith(color: kgreycolor, fontStyle: FontStyle.italic),
        ),
        SizedBox(height: 18),
        bookrating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        SizedBox(height: 37),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: buttonsbook(bookentitylink: bookchecked),
        ),
      ],
    );
  }
}
