import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constant.dart';
import 'package:movies_app/cubits/add_favourite_cubit/add_favourite_cubit.dart';
import 'package:movies_app/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/services/favourite_services.dart';

class MovieBackPoster extends StatefulWidget {
  const MovieBackPoster({super.key, required this.movie});
  final MovieDetailsModel movie;

  @override
  State<MovieBackPoster> createState() => _MovieBackPosterState();
}

class _MovieBackPosterState extends State<MovieBackPoster> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        widget.movie.backdropPath.isEmpty
            ? ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(0),
                child: Image.asset('assets/backdrop.png'),
              )
            : ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(0),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${widget.movie.backdropPath}',
                  height: 245,
                  // width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),

        Positioned.fill(
          // top: 100,
          // bottom: 0,
          // left: 0,
          // right: 0,
          // height: 90,
          child: Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  kPrimaryColor.withAlpha(120),
                  kPrimaryColor,
                ],
                stops: const [0.0, 0.45, 0.8, 1.0],
              ),
            ),
          ),
        ),
        Positioned(
          // top: 28,
          top: 38,
          left: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                // color: Colors.black.withAlpha(180),
                gradient: LinearGradient(
                  colors: [
                    // Colors.black.withAlpha(240),
                    // Colors.black.withAlpha(190),
                    // Colors.black.withAlpha(120),
                    kPrimaryColor.withAlpha(255),
                    kPrimaryColor.withAlpha(200),
                    // kPrimaryColor.withAlpha(150),
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(50),
                border: Border(
                  top: BorderSide(color: Colors.white.withAlpha(50), width: 1),
                ),
              ),
              child: Icon(
                Icons.chevron_left_rounded,
                size: 32,
                color: kTextColor,
                // color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          // top: 28,
          top: 38,
          right: 16,
          child: GestureDetector(
            onTap: () {
              setState(() {
                BlocProvider.of<AddFavCubit>(
                  context,
                ).addFavourite(widget.movie.toMovieModel());
                BlocProvider.of<FavCubit>(context).fetchAllFav();
              });
            },
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                // color: Colors.black.withAlpha(200),
                gradient: LinearGradient(
                  colors: [
                    // Colors.black.withAlpha(240),
                    // Colors.black.withAlpha(190),
                    // Colors.black.withAlpha(120),
                    kPrimaryColor.withAlpha(255),
                    kPrimaryColor.withAlpha(200),
                    // kPrimaryColor.withAlpha(120),
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(50),
                border: Border(
                  top: BorderSide(color: Colors.white.withAlpha(50), width: 1),
                ),
              ),
              child: FavouritesService().isFavourite(widget.movie.id)
                  ? Icon(
                      Icons.bookmark_added_rounded,
                      color: kIconsColor,
                      size: 24,
                    )
                  : Icon(
                      Icons.bookmark_add_rounded,
                      color: kTextColor,
                      size: 24,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
