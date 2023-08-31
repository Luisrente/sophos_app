import 'package:isar/isar.dart';

part 'movie.g.dart';


@collection
class Movie {

    Id? isarId ; // you can also use id = null to auto increment



  final String title;
  final int id;
  final bool isFavorite;


  Movie({
    required this.id,
    required this.title,
    required this.isFavorite,
  });
}
