import 'package:flutter/material.dart';
import 'package:movies_db_api/utils/text.dart';

class Description extends StatelessWidget {
  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.ratings,
      required this.releaseDate})
      : super(key: key);

  final String name, description, bannerUrl, posterUrl, ratings, releaseDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: CustomText(
                      text: '⭐ Average Rating : ' + ratings,
                      color: Colors.white,
                      size: 20),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: CustomText(
                text: name != null ? 'Title : ' + name : 'Unable to Load',
                color: Colors.white,
                size: 25),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: CustomText(
                text: releaseDate != null
                    ? 'Release Date : ' + releaseDate
                    : 'Unable to load',
                color: Colors.white,
                size: 20),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            height: 250,
            width: 150,
            child: Image.network(posterUrl),
          ),
          Container(
            child: CustomText(
                text: description != null
                    ? 'Synopsis : ' + description
                    : 'Unable to load',
                color: Colors.white,
                size: 20),
          )
        ],
      ),
    );
  }
}
