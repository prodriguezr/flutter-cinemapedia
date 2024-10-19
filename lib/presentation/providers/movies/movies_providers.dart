import 'package:cinemapedia/domain/entities/movie_entity.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final getMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(getMovies: getMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback getMovies;

  MoviesNotifier({required this.getMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> movies = await getMovies(page: currentPage);

    state = [...state, ...movies];
  }
}
