import 'package:bookly2/core/utils/app_assets.dart';
import 'package:bookly2/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class customappbar extends StatelessWidget {
  const customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(appassets.logo, height: 18),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(approuter.ksearchview);
              },
              icon: Icon(Icons.search))
        ],
      ),
    );
  }
}
