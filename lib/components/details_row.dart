import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:movies_app/models/movie_details_model.dart';
import 'package:movies_app/screens/actor_profile_screen.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({super.key, required this.movie});
  final MovieDetailsModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InfoCard(
            icon: Iconsax.timer,
            label: 'Length',
            value: '${movie.runtime.toString()} min',
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: InfoCard(
            icon: CupertinoIcons.ticket_fill,
            label: 'Category',
            value: movie.genres.isNotEmpty && movie.genres != null
                ? movie.genres[0]
                : 'N/A',
          ),
        ),
      ],
    );
  }
}
