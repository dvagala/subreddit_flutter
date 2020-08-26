import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100.0,
        child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  height: 42.0,
                  color: Colors.black,
                )
              ],
            )),
      ),
    );
  }
}
