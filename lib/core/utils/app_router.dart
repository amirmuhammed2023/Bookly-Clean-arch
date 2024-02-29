import 'package:bookly2/core/utils/functions/service_locator.dart';
import 'package:bookly2/features/home/domain/entities/booksentity.dart';
import 'package:bookly2/features/home/presentation/views/details_view.dart';
import 'package:bookly2/features/home/presentation/views/home_view.dart';
import 'package:bookly2/features/search/data/repository/search_repo_impl.dart';
import 'package:bookly2/features/search/domain/use_cases/fetch_relevant_books_usecases.dart';
import 'package:bookly2/features/search/presentation/management/cubit/searched_books_cubit.dart';
import 'package:bookly2/features/search/presentation/views/search_view.dart';
import 'package:bookly2/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class approuter {
  static const khomeview = "/homeview";
  static const kdetailsview = "/detailsview";
  static const ksearchview = "/searchsview";

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const splashview();
      },
    ),
    GoRoute(
      path: khomeview,
      builder: (BuildContext context, GoRouterState state) {
        return const homeview();
      },
    ),
    GoRoute(
      path: ksearchview,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => SearchedBooksCubit(
            fetchrelevantbooksusecases(getit.get<searchrepoimpl>()),
          ),
          child: searchview(),
        );
      },
    ),
    GoRoute(
      path: kdetailsview,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => SearchedBooksCubit(
            fetchrelevantbooksusecases(getit.get<searchrepoimpl>()),
          ),
          child: detailsview(
            bookchecked: state.extra as booksentity,
          ),
        );
      },
    ),
  ]);
}
