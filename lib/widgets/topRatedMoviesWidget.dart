import 'package:flutter/material.dart';
import 'package:movies_db_api/utils/text.dart';
import 'package:movies_db_api/main.dart';

import '../description.dart';

class TopRatedMoviesWidget extends StatelessWidget {
  const TopRatedMoviesWidget({Key? key, required this.topRatedMoviesParameter})
      : super(key: key);

  final List topRatedMoviesParameter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CustomText(
              text: 'Top Rated Movies', color: Colors.white, size: 25),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRatedMoviesParameter.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: topRatedMoviesParameter[index]['title'],
                          description: topRatedMoviesParameter[index]
                              ['overview'],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                              topRatedMoviesParameter[index]['backdrop_path'],
                          posterUrl: 'https://image.tmdb.org/t/p/w500' +
                              topRatedMoviesParameter[index]['poster_path'],
                          ratings: topRatedMoviesParameter[index]
                                  ['vote_average']
                              .toString(),
                          releaseDate: topRatedMoviesParameter[index]
                              ['release_date'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 200,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        topRatedMoviesParameter[index]
                                            ['backdrop_path']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: CustomText(
                              text: topRatedMoviesParameter[index]['title'] !=
                                      null
                                  ? topRatedMoviesParameter[index]['title']
                                  : 'Loading',
                              color: Colors.white,
                              size: 13),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
