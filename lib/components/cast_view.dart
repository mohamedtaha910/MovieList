import 'package:flutter/material.dart';
import 'package:movies_app/constant.dart';
import 'package:movies_app/models/cast_model.dart';
// import 'package:movies_app/screens/actor_movies_screen.dart';
import 'package:movies_app/screens/actor_profile_screen.dart';
import 'package:movies_app/services/movies_sevices.dart';

class CastView extends StatelessWidget {
  const CastView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    List<CastModel> castList = [];
    return FutureBuilder(
      future: MoviesServices().getMovieCast(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          castList = snapshot.data as List<CastModel>;
          return castList.isEmpty
              ? Center(
                  child: const Text(
                    'The cast is not available !',
                    style: TextStyle(
                      fontSize: 14,
                      color: kTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      castList.length,
                      (index) => GestureDetector(
                        onLongPress: () {
                          buildActorDialog(context, castList, index);
                        },
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ActorProfileScreen(
                                actorId: castList[index].id,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade100.withAlpha(50),
                              width: 0.6,
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
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey.shade100.withAlpha(50),
                                    width: 0.4,
                                  ),
                                ),
                                child: castList[index].profilePath.isEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                        child: Image.asset(
                                          'assets/person.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w500${castList[index].profilePath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                // backgroundColor: Colors.grey.withAlpha(50),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6.0,
                                ),
                                child: Text(
                                  castList[index].name.length >= 11
                                      ? '${castList[index].name.substring(0, 11)}...'
                                      : castList[index].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6.0,
                                ),
                                child: Text(
                                  castList[index].character.length >= 14
                                      ? ' ${castList[index].character.substring(0, 14)}...'
                                      : castList[index].character == ''
                                      ? ' Unknown '
                                      : ' ${castList[index].character} ',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: kTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
        } else if (snapshot.hasError) {
          return Text(' The cast is Not Available');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<dynamic> buildActorDialog(
    BuildContext context,
    List<CastModel> castList,
    int index,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey.shade100.withAlpha(50),
              width: 0.4,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                // padding: ,
                height: 295,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade100.withAlpha(50),
                    width: 0.4,
                  ),
                ),
                child: castList[index].profilePath.isEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/person.jpg',
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${castList[index].profilePath}',
                          fit: BoxFit.cover,
                        ),
                      ),

                // backgroundColor: Colors.grey.withAlpha(50),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  castList[index].name,

                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  castList[index].character == ''
                      ? ' Unknown '
                      : ' ${castList[index].character} ',

                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    color: kTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}
