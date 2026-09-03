import 'package:flutter/material.dart';
import 'package:movies_app/constant.dart';
import 'package:shimmer/shimmer.dart';

class CastShimmer extends StatelessWidget {
  const CastShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          10,
          (index) => Shimmer.fromColors(
            baseColor: Colors.black26,
            highlightColor: kTextColor.withAlpha(50),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade100.withAlpha(50),
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              // height: 200,
              // width: 110,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // padding: ,
                    height: 148,
                    width: 112,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      border: Border.all(
                        color: Colors.grey.shade100.withAlpha(50),
                        width: 0.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    margin: EdgeInsets.only(left: 6),
                    height: 10,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    margin: EdgeInsets.only(left: 6),
                    height: 10,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
