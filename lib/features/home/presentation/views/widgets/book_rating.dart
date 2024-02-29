import 'package:bookly2/constants.dart';
import 'package:bookly2/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class bookrating extends StatelessWidget {
  const bookrating({super.key, this.mainAxisAlignment});
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
        ),
        SizedBox(width: 6.3),
        Text("4.8", style: appstyles.text16),
        SizedBox(width: 5),
        Text("(245)", style: appstyles.text14.copyWith(color: kgreycolor)),
      ],
    );
  }
}
