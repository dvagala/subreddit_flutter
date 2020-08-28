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

  static const MID_GREY = Color(0xFF9a9a9a);
  static const LIGHT_GREY = Color(0xFFC7C7CC);
  static const PALE_GREY = Color(0xFFE7E7E7);
  static const IOS_APPBAR_PALE_GREY = Color(0xfff4f4f4);

  static const SHADOW_ELEVATION = 14.0;
  static const SHADOW_COLOR = Color(0x40000000);
  static const CARD_CORNER_MARGIN = EdgeInsets.fromLTRB(9, 9, 9, 0);
  static const CARD_SHAPE = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(9.0)));

  static const CARD_TEXT_PADDING =
      const EdgeInsets.symmetric(vertical: 14, horizontal: 17);
}
