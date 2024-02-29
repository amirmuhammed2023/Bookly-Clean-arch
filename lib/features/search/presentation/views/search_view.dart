import 'package:bookly2/features/search/presentation/views/widget/search_view_body.dart';
import 'package:flutter/material.dart';

class searchview extends StatelessWidget {
  const searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: searchviewbody(),
      ),
    );
  }
}
