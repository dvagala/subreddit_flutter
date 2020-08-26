import 'package:flutter/material.dart';
import 'package:subreddit_flutter/constants.dart' as Constants;
import 'package:subreddit_flutter/models/post.dart';

class PostDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            post.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Divider(
            color: Colors.black,
            height: 30,
          ),
          Text(post.content)
        ])),
      )),
      appBar: AppBar(),
    );
  }
}
