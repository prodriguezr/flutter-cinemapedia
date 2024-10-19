import 'package:cinemapedia/domain/entities/entities.dart' show Movie;

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
