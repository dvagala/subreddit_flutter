import 'package:flutter/material.dart';
import 'package:subreddit_flutter/constants.dart';

class HomeScreenSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 115.0,
      floating: false,
      pinned: true,
      snap: false,
      elevation: Constants.SHADOW_ELEVATION,
      shadowColor: Constants.SHADOW_COLOR,
      backgroundColor: Color(0xfaffffff),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(
          left: 14,
          bottom: 13,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3),
              child: Text(
                "HOT POSTS",
                style: TextStyle(
                    fontSize: 8, color: Constants.MID_GREY, letterSpacing: 0.5),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "r/FlutterDev",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 13),
                  child: Image(
                      height: 20,
                      image: AssetImage('assets/icons/flutter_logo.png')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
