import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/components/movie_item.dart';
import 'package:movies_app/constant.dart';
import 'package:movies_app/models/category_model.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/screens/movie_details_page.dart';
import 'package:movies_app/services/movies_sevices.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: kPrimaryColor,
      //   surfaceTintColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      //   title: Row(
      //     children: [
      //       GestureDetector(
      //         onTap: () {
      //           Navigator.of(context).pop();
      //         },
      //         child: Container(
      //           padding: EdgeInsets.all(0.8),
      //           decoration: BoxDecoration(
      //             // color: Colors.white.withAlpha(25),
      //             gradient: LinearGradient(
      //               colors: [
      //                 Colors.white.withAlpha(50),
      //                 // Colors.white.withAlpha(20),
      //                 Colors.white.withAlpha(10),
      //               ],
      //               begin: AlignmentGeometry.topCenter,
      //               end: AlignmentGeometry.bottomCenter,
      //             ),
      //             borderRadius: BorderRadius.circular(50),
      //             border: Border(
      //               top: BorderSide(
      //                 color: Colors.grey.shade100.withAlpha(50),
      //                 width: 0.4,
      //               ),
      //             ),
      //           ),
      //           child: Icon(
      //             Icons.chevron_left_rounded,
      //             size: 32,
      //             color: kTextColor,
      //           ),
      //         ),
      //       ),
      //       const SizedBox(width: 16),
      //       Text(
      //         category.name,
      //         style: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //           color: kTextColor,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 65,),
                  FutureBuilder(
                    future: MoviesServices().getMoviesByCategory(category.id),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<MovieModel> movies = snapshot.data!;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            // physics: const BouncingScrollPhysics(),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              mainAxisSpacing: 18,
                              crossAxisSpacing: 15, //
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
                                child: MovieItem(movieImage: movies[index].poster),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                           GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                
                                  child: Container(
                                    padding: EdgeInsets.all(0.8),
                                    decoration: BoxDecoration(
                                      // color: Colors.white.withAlpha(25),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withAlpha(50),
                                          // Colors.white.withAlpha(20),
                                          Colors.white.withAlpha(5),
                                        ],
                                        begin: AlignmentGeometry.topCenter,
                                        end: AlignmentGeometry.bottomCenter,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border(
                                        top: BorderSide(
                                          color: Colors.grey.shade100.withAlpha(50),
                                          width: 0.4,
                                        ),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.chevron_left_rounded,
                                      size: 32,
                                      color: kTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(width: 16,),
                      Text(
                        category.name,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
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
