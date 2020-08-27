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
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.fromLTRB(
          14,
          0,
          0,
          13,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
              child: Text(
                "HOT POSTS",
                style: TextStyle(
                    fontSize: 8,
                    color: Constants.LIGHT_GREY,
                    letterSpacing: 0.5),
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
                  padding: EdgeInsets.fromLTRB(0, 0, 13, 0),
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
