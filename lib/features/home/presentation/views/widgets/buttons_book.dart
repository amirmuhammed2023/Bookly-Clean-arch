import 'package:bookly2/core/utils/functions/launch_url.dart';
import 'package:bookly2/core/widgets/custom_button.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:flutter/material.dart';

class buttonsbook extends StatelessWidget {
  const buttonsbook({super.key, required this.bookentitylink});
  final booksentity bookentitylink;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: custombutton(
            onpressed: () {},
            text: "19.99 \$",
            theborderradius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: custombutton(
            onpressed: () async {
              await launchurl(context, bookentitylink.link);
            },
            text:
                bookentitylink.link == null ? "Not Available" : "Free Preview",
            textcolor: Colors.white,
            thecolor: Color(0xffEF8262),
            theborderradius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
