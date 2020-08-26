import 'package:flutter/material.dart';
import 'package:subreddit_flutter/models/post.dart';
import 'package:subreddit_flutter/screens/home/widgets/placeholderCard.dart';
import 'package:subreddit_flutter/screens/home/widgets/postCard.dart';

class PostCardsListView extends StatelessWidget {
  final List<Post> posts;
  final Function refreshWasTriggered;

  PostCardsListView({this.posts, this.refreshWasTriggered});

  @override
  Widget build(BuildContext context) {
    List<Widget> items;

//     while posts are being loaded, show only placeholders
    if (this.posts == null) {
      items = List.filled(3, PlaceholderCard());
    } else {
      items = posts.map((post) => PostCard(post: post)).toList();
    }

    return RefreshIndicator(
        child: ListView(padding: EdgeInsets.all(20), children: items),
        onRefresh: () {
          return this.refreshWasTriggered();
        });
  }
}
