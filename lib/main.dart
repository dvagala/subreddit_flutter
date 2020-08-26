import 'package:flutter/material.dart';
import 'package:subreddit_flutter/screens/home/home.dart';
import 'package:subreddit_flutter/screens/postDetail/postDetail.dart';
import 'package:subreddit_flutter/constants.dart' as Constants;

void main() {
  runApp(MaterialApp(
    routes: {
      Constants.HOME_ROUTE: (context) => Home(),
      Constants.POST_DETAIL_ROUTE: (context) => PostDetail(),
    },
  ));
}
