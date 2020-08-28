import 'package:flutter/material.dart';
import 'package:subreddit_flutter/models/post.dart';
import 'package:subreddit_flutter/constants.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  PostDetail({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.symmetric(vertical: 22, horizontal: 28),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            post.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          if (post.content.isNotEmpty) ...[
            Divider(
              color: Colors.black,
              endIndent: 260,
              height: 40,
            ),
            Text(post.content)
          ]
        ]),
      ))),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.IOS_APPBAR_PALE_GREY,
        bottom: PreferredSize(
            child: Container(
              color: Constants.PALE_GREY,
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(1.0)),
      ),
    );
  }
}
