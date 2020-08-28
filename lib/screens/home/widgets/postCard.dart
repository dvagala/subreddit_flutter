import 'package:flutter/material.dart';
import 'package:subreddit_flutter/constants.dart';
import 'package:subreddit_flutter/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: Constants.CARD_CORNER_MARGIN,
      elevation: Constants.SHADOW_ELEVATION,
      shadowColor: Constants.SHADOW_COLOR,
      color: Colors.white,
      shape: Constants.CARD_SHAPE,
      child: new InkWell(
        onTap: () {
          Navigator.pushNamed(context, Constants.POST_DETAIL_ROUTE,
              arguments: this.post);
        },
        child: Stack(
          children: [
            Padding(
              padding: Constants.CARD_TEXT_PADDING,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.post.title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3),
                  ),
                  if (this.post.content.isNotEmpty) ...[
                    Divider(
                      color: Colors.black,
                      endIndent: 260,
                      thickness: 1,
                    ),
                    Text(
                      this.post.truncatedContent,
                      style: TextStyle(fontSize: 12),
                    ),
                  ]
                ],
              ),
            ),
            Positioned(
                bottom: 9,
                right: 6,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Constants.LIGHT_GREY,
                  size: 15,
                ))
          ],
        ),
      ),
    );
  }
}
