import 'package:flutter/material.dart';
import 'package:movies_db_api/description.dart';
import 'package:movies_db_api/utils/text.dart';
import 'package:movies_db_api/main.dart';

class TrendingMoviesWidget extends StatelessWidget {
  const TrendingMoviesWidget({Key? key, required this.trendingMoviesParameter})
      : super(key: key);

  final List trendingMoviesParameter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CustomText(
              text: 'Trending Movies', color: Colors.white, size: 25),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingMoviesParameter.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: trendingMoviesParameter[index]['title'],
                          description: trendingMoviesParameter[index]
                              ['overview'],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                              trendingMoviesParameter[index]['backdrop_path'],
                          posterUrl: 'https://image.tmdb.org/t/p/w500' +
                              trendingMoviesParameter[index]['poster_path'],
                          ratings: trendingMoviesParameter[index]
                                  ['vote_average']
                              .toString(),
                          releaseDate: trendingMoviesParameter[index]
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
                          height: 140,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trendingMoviesParameter[index]
                                            ['backdrop_path']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: CustomText(
                              text: trendingMoviesParameter[index]['title'] !=
                                      null //its giving null error because some movies have their title property as 'title' ans some 'name'
                                  ? trendingMoviesParameter[index]['title']
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
