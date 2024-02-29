import 'package:bookly2/constants.dart';
import 'package:bookly2/core/utils/app_router.dart';
import 'package:bookly2/core/utils/functions/service_locator.dart';
import 'package:bookly2/core/utils/simple_bloc_observer.dart';
import 'package:bookly2/features/home/data/repository/home_repo_impl.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/domain/use_cases/fetch_all_books_usecases.dart';
import 'package:bookly2/features/home/domain/use_cases/fetch_newest_books_usecases.dart';
import 'package:bookly2/features/home/presentation/management/cubit/all_books_cubit.dart';
import 'package:bookly2/features/home/presentation/management/cubit2/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(booksentityAdapter());
  await Hive.openBox<booksentity>(kfeaturedbox);
  await Hive.openBox<booksentity>(knewestbox);
  Bloc.observer = simpleblocobserver();
  servicelocator();
  runApp(const bookly2());
}

class bookly2 extends StatelessWidget {
  const bookly2({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllBooksCubit(
            fetchallbooksusecases(
              getit.get<homerepoimpl>(),
            ),
          )..fetchallbooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            fetchnewestbooksusecases(
              getit.get<homerepoimpl>(),
            ),
          )..fetchnewestbooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: approuter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kmaincolor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
