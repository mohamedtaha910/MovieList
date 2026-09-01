import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constant.dart';

class DateAndRate extends StatelessWidget {
  const DateAndRate({super.key, required this.date, required this.rate});
  final String date;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white.withAlpha(15),
            border: Border.all(
              color: Colors.grey.shade100.withAlpha(50),
              width: 0.4,
            ),
          ),
          child: Row(
            children: [
              const Icon(CupertinoIcons.calendar, size: 18, color: kTextColor),
              const SizedBox(width: 6),
              Text(
                date.length >= 4 ? date.substring(0, 4) : date,
                style: const TextStyle(
                  fontSize: 13,
                  color: kTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 8),
        Container(
          // margin: const EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1.5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orangeAccent.withAlpha(50),
                Colors.orangeAccent.withAlpha(20),
              ],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(100),
            // border: Border(
            // top: BorderSide(
            //   color: Colors.orangeAccent
            //       .withAlpha(60),
            //   width: 0.7,
            // ),
            // ),
            border: Border.all(
              color: Colors.orangeAccent.withAlpha(50),

              width: 0.4,
            ),
            // color: kTextColor.withAlpha(60),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star_rounded,
                size: 18,
                color: Colors.orangeAccent,
              ),
              const SizedBox(width: 5),
              Text(
                rate.toString().substring(0, 3),
                style: const TextStyle(
                  fontSize: 13,
                  // color: kTextColor,
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
