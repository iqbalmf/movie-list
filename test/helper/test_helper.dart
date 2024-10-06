import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_list/data/datasource/movie_local_datasource.dart';
import 'package:movie_list/data/datasource/movie_remote_datasource.dart';
import 'package:movie_list/domain/repository/movie_repository.dart';
import 'package:movie_list/utils/api_helper.dart';
import 'package:movie_list/utils/network_status.dart';

@GenerateMocks(
  [ApiHelper, MovieRepository, MovieRemoteDatasource, MovieLocalDatasource, NetworkInfo],
  customMocks: [MockSpec<Dio>(as: #MockDioClient)],
)
void main() {}
