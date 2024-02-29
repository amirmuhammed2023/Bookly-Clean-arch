import 'package:bookly2/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class custombutton extends StatelessWidget {
  const custombutton(
      {super.key,
      required this.text,
      this.thecolor = Colors.white,
      this.textcolor = Colors.black,
      this.theborderradius,
      required this.onpressed});
  final String text;
  final Color? thecolor, textcolor;
  final BorderRadius? theborderradius;
  final void Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: appstyles.text14
              .copyWith(color: textcolor, fontWeight: FontWeight.w900),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: thecolor,
          shape: RoundedRectangleBorder(
              borderRadius: theborderradius ?? BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
