import 'package:bookly2/constants.dart';
import 'package:bookly2/core/utils/app_styles.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly2/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class bookinformation extends StatelessWidget {
  const bookinformation({super.key, required this.bookdetails});
  final booksentity bookdetails;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          custombookitem(aspect: 2.2 / 3.5, imageurl: bookdetails.image ?? ""),
          SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookdetails.title,
                  style: appstyles.text20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 3),
                Text(
                  bookdetails.author ?? "",
                  style: appstyles.text14.copyWith(color: kgreycolor),
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${bookdetails.price.toString()} \$",
                      style: appstyles.text20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    bookrating()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
