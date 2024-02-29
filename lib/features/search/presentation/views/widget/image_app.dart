import 'package:bookly2/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class imageapp extends StatelessWidget {
  const imageapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      appassets.books2image,
      width: MediaQuery.of(context).size.width * 0.5,
    );
  }
}
