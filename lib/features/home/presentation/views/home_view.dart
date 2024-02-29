import 'package:bookly2/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class homeview extends StatelessWidget {
  const homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeviewbody(),
    );
  }
}
