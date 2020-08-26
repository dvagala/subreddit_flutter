import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/post.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final posts = getPostsHttp();

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "r/FlutterDeb",
              style: TextStyle(height: 1, backgroundColor: Colors.red),
            ),
            FutureBuilder(
                future: posts,
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Expanded(
                      child: PostCardsListView(posts: snapshot.data),
                    );
                  } else {
                    return Expanded(
                      child: PostCardsListView(posts: null),
                    );
                  }
                }),
          ]),
        ),
      ),
    );
  }
}

Future<List<Post>> getPostsHttp() async {
  List<Post> posts = [];

  String url = "https://www.reddit.com/r/FlutterDev/hot.json?limit=20";

  try {
    Response response = await Dio().get(url);

    // TODO: restrict to 20
    for (var child in response.data["data"]["children"]) {
      String title = child["data"]["title"];
      String content = child["data"]["selftext"];

      posts.add(Post(title: title, content: content));
    }
  } catch (e) {
    return null;
  }

  return posts;
}

class PostCardsListView extends StatelessWidget {
  final List<Post> posts;

  PostCardsListView({this.posts});

  @override
  Widget build(BuildContext context) {
    List<Widget> items;

    // while posts are being loaded, show only placeholders
    if (this.posts == null) {
      items = List.filled(3, PlaceholderCard());
    } else {
      items = posts.map((post) => PostCard(post: post)).toList();
    }

    return ListView(padding: EdgeInsets.all(20), children: items);
  }
}

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

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
