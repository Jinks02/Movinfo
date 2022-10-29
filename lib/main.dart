import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_db_api/utils/text.dart';
import 'package:movies_db_api/widgets/topRatedMoviesWidget.dart';
import 'package:movies_db_api/widgets/trendingMoviesWidget.dart';
import 'package:movies_db_api/widgets/tvShowsPopularWidget.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMoviesList = [];
  List topRatedMoviesList = [];
  List tvShowsPopularList = [];
  final String apiKey = '07f282114c788834f3f2bc5d9b524f78';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwN2YyODIxMTRjNzg4ODM0ZjNmMmJjNWQ5YjUyNGY3OCIsInN1YiI6IjYyZjhmYzgzNmY1M2UxMDA3YjM4ODdmYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Q320mU-5WLyQNQntLVltCQIPbQQozHCruGPoSDGDiKQ';

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbObjWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingMoviesResult = await tmdbObjWithCustomLogs.v3.trending
        .getTrending(); // get trending func gets trending movies in Map form

    Map topRatedMoviesResult =
        await tmdbObjWithCustomLogs.v3.movies.getTopRated();

    Map tvShowsPopularResult = await tmdbObjWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMoviesList = trendingMoviesResult['results'];
      topRatedMoviesList = topRatedMoviesResult['results'];
      tvShowsPopularList = tvShowsPopularResult['results'];
    });
    log(trendingMoviesList.toString());
  }

  //from the api we are going to get a Map ie. key value pairs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff00008B),
        centerTitle: true,
        title: const CustomText(text: 'Moviefy', color: Colors.white, size: 25),
      ),
      body: ListView(
        children: [
          TrendingMoviesWidget(
            trendingMoviesParameter: trendingMoviesList,
          ),
          TopRatedMoviesWidget(topRatedMoviesParameter: topRatedMoviesList),
          TvShowsPopularWidget(tvShowsPopularParameter: tvShowsPopularList)
        ],
      ),
    );
  }
}
