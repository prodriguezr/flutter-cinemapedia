import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import 'package:cinemapedia/infraestructure/datasources/themoviedb/themoviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider<MoviesRepository>((ref) {
  return TheMovieDbRepositoryImpl(TheMovieDbDatasource());
});
