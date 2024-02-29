import 'package:bookly2/core/utils/app_styles.dart';
import 'package:bookly2/features/home/presentation/management/cubit2/newest_books_cubit.dart';
import 'package:bookly2/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly2/features/home/presentation/views/widgets/list_of_books_bloc.dart';
import 'package:bookly2/features/home/presentation/views/widgets/list_of_booksinformation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homeviewbody extends StatefulWidget {
  const homeviewbody({super.key});

  @override
  State<homeviewbody> createState() => _homeviewbodyState();
}

class _homeviewbodyState extends State<homeviewbody> {
  late ScrollController _scrollcontroller;
  int nextpage = 1;
  bool isloading = false;
  @override
  void initState() {
    super.initState();
    _scrollcontroller = ScrollController();
    _scrollcontroller.addListener(_scrolllistener);
  }

  void _scrolllistener() async {
    var currentposition = _scrollcontroller.position.pixels;
    var maxscroll = _scrollcontroller.position.maxScrollExtent;

    if (currentposition >= 0.7 * maxscroll) {
      if (!isloading) {
        //print("$isloading${!isloading} ");
        isloading = true;
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchnewestbooks(pagenumber: nextpage++);
        isloading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollcontroller,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: customappbar(),
              ),
              listofbooksbloc(),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text("Best Seller", style: appstyles.text18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: listofbooksinformationbloc(),
        ))
      ],
    );
  }
}
