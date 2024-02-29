import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class customdetailsappbar extends StatelessWidget {
  const customdetailsappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.close)),
        IconButton(onPressed: () {}, icon: Icon(Icons.add_shopping_cart))
      ],
    );
  }
}
