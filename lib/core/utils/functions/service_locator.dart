import 'package:bookly2/core/utils/api_services.dart';
import 'package:bookly2/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly2/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly2/features/home/data/repository/home_repo_impl.dart';
import 'package:bookly2/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly2/features/search/data/repository/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void servicelocator() {
  getit.registerSingleton<apiservices>(apiservices(Dio()));

  getit.registerSingleton<homerepoimpl>(
    homerepoimpl(
      homeremotedatasourceimpl(
        getit.get<apiservices>(),
      ),
      homelocaldatasourceimpl(),
    ),
  );

  getit.registerSingleton<searchrepoimpl>(
    searchrepoimpl(
      searchremotedatasourceimpl(
        getit.get<apiservices>(),
      ),
    ),
  );
}
