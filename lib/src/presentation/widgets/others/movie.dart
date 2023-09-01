import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sophos_app/src/domain/entities/entities.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const MovieItem(
      {super.key, required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
   
    return GestureDetector(
      onTap: () {
        onMovieSelected();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(59, 241, 237, 237)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.23,
                height: size.width * 0.37,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    fit: BoxFit.cover,
                    width: 150,
                    movie.imageUrl,
                    loadingBuilder: (context, child, loadingProgress) =>
                        FadeIn(child: child),
                  ),
                ),
              ),
      
              const SizedBox(width: 10),
      
              // Description
              SizedBox(
                width: size.width * 0.45,
                height: size.width * 0.37,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title, style: textStyles.titleMedium),
                    (movie.title.length > 100)
                        ? Text('${movie.title.substring(0, 20)}...')
                        : Text(movie.title),
                    Row(
                      children: [
                        Icon(Icons.star_half_rounded,
                            color: Colors.yellow.shade800),
                        const SizedBox(width: 5),
                        Text(
                          '1.9',
                          style: textStyles.bodyMedium!
                              .copyWith(color: Colors.yellow.shade900),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 30),
      
              // SizedBox(
              //   width: size.width * 0.05,
              //   child: GestureDetector(
              //     onTap: () {
              //       onMovieSelected();
              //     },
              //     child: Icon(
              //       Icons.favorite_border,
              //       color: movie.isFavorite ? Colors.red : Colors.grey,
              //       size: 30
              //     ),
              //   ),
              // ),
              GestureDetector(
  onTap: () {
  },
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 7),
    child: Stack(
      children: [ Row(
        children: [
        Container(
          color: movie.isFavorite ? Colors.red : Colors.transparent,
        ),
          SizedBox(
            width: size.width * 0.05,
            child: IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.favorite,
                color: movie.isFavorite ? Colors.red : Colors.grey,
                size: 30,
              ),
              padding: const EdgeInsets.all(10),
            ),
          ),
        ],
      ),
      ]
    ),
            
  ),
)





            ],
          ),
        ),
      ),
    );
  }
}
