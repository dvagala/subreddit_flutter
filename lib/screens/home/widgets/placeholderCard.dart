import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:subreddit_flutter/constants.dart';

class PlaceholderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: Constants.CARD_CORNER_MARGIN,
      elevation: Constants.SHADOW_ELEVATION,
      shadowColor: Constants.SHADOW_COLOR,
      color: Colors.white,
      shape: Constants.CARD_SHAPE,
      child: Padding(
        padding: Constants.CARD_TEXT_PADDING,
        child: Shimmer.fromColors(
            baseColor: Constants.PALE_GREY,
            highlightColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  height: 17.0,
                  width: 150,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 17,
                ),
                new Container(
                  height: 13.0,
                  width: 100,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 4,
                ),
                new Container(
                  height: 13.0,
                  width: 270,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 4,
                ),
                new Container(
                  height: 13.0,
                  width: 240,
                  color: Colors.black,
                )
              ],
            )),
      ),
    );
  }
}
