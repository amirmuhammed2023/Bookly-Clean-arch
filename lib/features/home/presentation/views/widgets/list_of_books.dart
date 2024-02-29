import 'package:bookly2/core/utils/app_router.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/presentation/management/cubit/all_books_cubit.dart';
import 'package:bookly2/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class listofbooks extends StatefulWidget {
  const listofbooks({super.key, required this.mybooks});
  final List<booksentity> mybooks;

  @override
  State<listofbooks> createState() => _listofbooksState();
}

class _listofbooksState extends State<listofbooks> {
  late ScrollController _scrollcontroller;
  var nextpage = 1;
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
        await BlocProvider.of<AllBooksCubit>(context)
            .fetchallbooks(pagenumber: nextpage++);
        isloading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: ListView.builder(
        controller: _scrollcontroller,
        scrollDirection: Axis.horizontal,
        itemCount: widget.mybooks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(
                  approuter.kdetailsview,
                  extra: widget.mybooks[index],
                );
              },
              child: custombookitem(
                  aspect: 2.6 / 4, imageurl: widget.mybooks[index].image ?? ""),
            ),
          );
        },
      ),
    );
  }
}
