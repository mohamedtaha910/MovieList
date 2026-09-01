import 'package:flutter/material.dart';
import 'package:movies_app/constant.dart';
import 'package:shimmer/shimmer.dart';

class SearchedMovieShimmer extends StatelessWidget {
  const SearchedMovieShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: kTextColor.withAlpha(50),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey, width: 0.6),
        ),
        // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
        child: Row(
          children: [
            // Poster Placeholder
            Container(
              height: 150,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title line 1
                  Container(
                    height: 18,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Title line 2
                  Container(
                    height: 10,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 6),

                  Container(
                    height: 10,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Rating box
                  Row(
                    children: [
                      Container(
                        height: 24,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 24,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // Arrow Placeholder
            Icon(Icons.arrow_forward_ios_rounded, size: 15, color: kTextColor),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
