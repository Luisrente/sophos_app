import 'package:sophos_app/src/domain/entities/entities.dart';
import 'package:sophos_app/src/domain/repositories/repositories_interface.dart';

class MovieUseCase {
  final ItemRepository repository;
  final MovieRepository localStorageRepository;
  
  MovieUseCase({ required this.repository, required this.localStorageRepository});

  Future<List<Movie>> getMovies() async {
      final itemsFromRepository = await repository.getItems();
    final moviesFromLocalStorage = await localStorageRepository.getMovies();

    final combinedMovies = <Movie>[];
    for (final item in itemsFromRepository) {
      final Movie foundMovie = moviesFromLocalStorage.firstWhere(
          (movie) => movie.title == item.title,
          orElse: () => Movie(
                imageUrl: '',
                isFavorite: false,
                title: '',
                id: -1,
              ));
      if (foundMovie.id == -1) {
        final combinedMovie = Movie(
          title: item.title,
          imageUrl: item.imageUrl,
          isFavorite: false,
        );
        combinedMovies.add(combinedMovie);
      } else {
       final  combined = Movie(
          title: item.title,
          imageUrl: item.imageUrl,
          isFavorite: foundMovie.isFavorite,
        );
        combinedMovies.add(combined);
      }
    }
    return combinedMovies;
  }
 

  Future<void> toggleFavorite(Movie item) async {
    await localStorageRepository.toggleFavorite(Movie(
        isFavorite: !item.isFavorite,
        id: item.id,
        title: item.title,
        imageUrl: item.imageUrl));
  }
}
