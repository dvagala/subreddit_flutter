import 'package:flutter/material.dart';
import 'package:subreddit_flutter/models/post.dart';
import 'package:subreddit_flutter/utils/snackBarHelper.dart';
import 'package:subreddit_flutter/constants.dart' as Constants;

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new InkWell(
        onTap: () {
          Navigator.pushNamed(context, Constants.POST_DETAIL_ROUTE,
              arguments: this.post);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              this.post.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(this.post.truncatedContent),
          ],
        ),
      ),
    );
  }
}
