import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class customitemshimmer extends StatelessWidget {
  const customitemshimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          height: 50,
          width: 50,
        ),
        baseColor: Colors.white24,
        highlightColor: Colors.white12);
  }
}
