import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class detailsview extends StatelessWidget {
  const detailsview({super.key, required this.bookchecked});
  final booksentity bookchecked;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: detailsviewbody(bookschecked: bookchecked),
      ),
    );
  }
}
