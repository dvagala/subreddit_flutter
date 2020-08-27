import 'package:flutter/material.dart';
import 'package:subreddit_flutter/models/post.dart';
import 'package:subreddit_flutter/screens/home/widgets/placeholderCard.dart';
import 'package:subreddit_flutter/screens/home/widgets/postCard.dart';

class PostCardsSliverList extends StatelessWidget {
  final List<Post> posts;
  final Function refreshWasTriggered;

  PostCardsSliverList({this.posts, this.refreshWasTriggered});

  @override
  Widget build(BuildContext context) {
    List<Widget> items;

//     while posts are being loaded, show only placeholders
    if (this.posts == null) {
      items = List.filled(20, PlaceholderCard());
    } else {
      items = posts.map((post) => PostCard(post: post)).toList();
    }

    return SliverPadding(
      padding: EdgeInsets.only(bottom: 30),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => items[index],
          childCount: items.length,
        ),
      ),
    );
  }
}
