library constants;

import 'package:flutter/material.dart';

class Constants {
  static const String NETWORK_ERROR_MSG =
      "Network error! Can't fetch new posts.";
  static const int NUMBER_OF_POSTS_TO_SHOW = 20;

  static const String POST_DETAIL_ROUTE = "/postDetail";
  static const String HOME_ROUTE = "/";

  static const String POST_TITLE_KEY = "title";
  static const String POST_CONTENT_KEY = "content";

  static const LIGHT_GREY = Color(0xFF9a9a9a);
}
