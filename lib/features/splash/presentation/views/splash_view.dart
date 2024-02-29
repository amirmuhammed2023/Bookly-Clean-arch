import 'package:bookly2/core/utils/app_assets.dart';
import 'package:bookly2/core/utils/app_router.dart';
import 'package:bookly2/features/splash/presentation/views/widgets/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class splashview extends StatefulWidget {
  const splashview({super.key});

  @override
  State<splashview> createState() => _splashviewState();
}

class _splashviewState extends State<splashview>
    with SingleTickerProviderStateMixin {
  late AnimationController animationcontroller;
  late Animation<Offset> slidinganimation;

  @override
  void initState() {
    animationcontroll();
    beatifulltransition();

    super.initState();
  }

  void beatifulltransition() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        GoRouter.of(context).push(approuter.khomeview);
        // Get.to(homeview(),
        //   transition: Transition.fade, duration: Duration(milliseconds: 500));
      },
    );
  }

  void animationcontroll() {
    animationcontroller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    slidinganimation = Tween<Offset>(begin: Offset(0, 5), end: Offset.zero)
        .animate(animationcontroller);

    animationcontroller.forward();
  }

  @override
  void dispose() {
    animationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(appassets.logo),
          SizedBox(height: 8),
          animatedtext(slidinganimation: slidinganimation)
        ],
      ),
    );
  }
}
