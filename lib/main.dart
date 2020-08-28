import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subreddit_flutter/constants.dart';
import 'package:subreddit_flutter/screens/home/home.dart';
import 'package:subreddit_flutter/screens/postDetail/postDetail.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.grey[500],
      accentColor: Colors.grey[500],
    ),
    onGenerateRoute: (settings) {
      Route page;
      switch (settings.name) {
        case Constants.POST_DETAIL_ROUTE:
          page = CupertinoPageRoute(
              builder: (context) => PostDetail(post: settings.arguments));
          break;
        case Constants.HOME_ROUTE:
          page = CupertinoPageRoute(builder: (context) => Home());
          break;
      }
      return page;
    },
  ));
}
