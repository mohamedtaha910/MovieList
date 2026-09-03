import 'package:flutter/material.dart';
import 'package:movies_app/constant.dart';
import 'package:shimmer/shimmer.dart';

class SimiliarMoviesShimmer extends StatelessWidget {
  const SimiliarMoviesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: kTextColor.withAlpha(50),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            10,
            (index) => Container(
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 6),
                    height: 165,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    // margin: EdgeInsets.only(left: 6),
                    height: 8,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
