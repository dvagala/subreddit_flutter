import 'package:flutter/material.dart';
import 'package:subreddit_flutter/constants.dart';
import 'package:subreddit_flutter/screens/home/home.dart';
import 'package:subreddit_flutter/screens/postDetail/postDetail.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.light,

      primarySwatch: Colors.grey,
      primaryColor: Colors.grey[500],
      primaryColorBrightness: Brightness.light,

      //this is what you want
      accentColor: Colors.grey[500],
      accentColorBrightness: Brightness.light,
    ),
    routes: {
      Constants.HOME_ROUTE: (context) => Home(),
      Constants.POST_DETAIL_ROUTE: (context) => PostDetail(),
    },
  ));
}
