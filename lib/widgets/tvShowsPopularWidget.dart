import 'package:flutter/material.dart';
import 'package:movies_db_api/utils/text.dart';
import 'package:movies_db_api/main.dart';

import '../description.dart';

class TvShowsPopularWidget extends StatelessWidget {
  const TvShowsPopularWidget({Key? key, required this.tvShowsPopularParameter})
      : super(key: key);

  final List tvShowsPopularParameter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CustomText(
              text: 'Popular TV Shows', color: Colors.white, size: 25),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvShowsPopularParameter.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: tvShowsPopularParameter[index]['original_name'],
                          description: tvShowsPopularParameter[index]
                              ['overview'],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                              tvShowsPopularParameter[index]['backdrop_path'],
                          posterUrl: 'https://image.tmdb.org/t/p/w500' +
                              tvShowsPopularParameter[index]['poster_path'],
                          ratings: tvShowsPopularParameter[index]
                                  ['vote_average']
                              .toString(),
                          releaseDate: tvShowsPopularParameter[index]
                              ['first_air_date'],
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
                                      tvShowsPopularParameter[index]
                                          ['backdrop_path'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: CustomText(
                              text: tvShowsPopularParameter[index]
                                          ['original_name'] !=
                                      null
                                  ? tvShowsPopularParameter[index]
                                      ['original_name']
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
