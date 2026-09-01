import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/components/movie_item.dart';
import 'package:movies_app/components/no_connection_body.dart';
import 'package:movies_app/constant.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/screens/discover_screen.dart';
// import 'package:movies_app/screens/favourite_page.dart';
import 'package:movies_app/screens/movie_details_page.dart';
// import 'package:movies_app/screens/search_page.dart';
import 'package:movies_app/services/movies_sevices.dart';
import 'package:movies_app/shimmers/movie_shimmer.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            FutureBuilder(
              future: MoviesServices().getPopularMovies(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<MovieModel> movies = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      left: 8.0,
                      top: 2.0,
                      // bottom: 16.0,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(height: 67),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.7,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 18, //
                                ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetails(id: movies[index].id),
                                    ),
                                  );
                                },
                                child: MovieItem(
                                  movieImage: movies[index].poster,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 80),
                        ],
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return NoConnectionBody();
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      // shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 18,
                          ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const MovieShimmer();
                      },
                    ),
                  );
                }
              },
            ),

            // app bar
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.red
                  gradient: LinearGradient(
                    colors: [
                      kPrimaryColor,

                      kPrimaryColor.withAlpha(220),
                      kPrimaryColor.withAlpha(150),
                      kPrimaryColor.withAlpha(120),
                      kPrimaryColor.withAlpha(50),
                      kPrimaryColor.withAlpha(5),
                    ],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                  ),
                ),
                padding: EdgeInsets.only(
                  right: 12,
                  left: 12,
                  top: 12,
                  bottom: 100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/Logo.svg',
                      height: 22,
                      colorFilter: ColorFilter.mode(
                        Color(0xfff53f3f).withAlpha(200),
                        BlendMode.srcIn,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const DiscoverScreen(isBack: true),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

                          child: Container(
                            // margin: const EdgeInsets.only(top: 8),
                            padding: const EdgeInsets.all(9),
                            // height: 43,
                            // width: 43,
                            decoration: BoxDecoration(
                              // color: Colors.black.withAlpha(70),
                              // color: Colors.white.withAlpha(20),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withAlpha(60),
                                  Colors.white.withAlpha(30),
                                  Colors.white.withAlpha(15),
                                ],
                                begin: AlignmentGeometry.topCenter,
                                end: AlignmentGeometry.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(100),
                              border: Border(
                                top: BorderSide(
                                  color: Colors.white.withAlpha(120),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/Search.svg',
                              colorFilter: ColorFilter.mode(
                                Colors.white54,
                                BlendMode.srcIn,
                              ),
                              height: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
