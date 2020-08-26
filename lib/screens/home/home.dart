import 'package:flutter/material.dart';
import 'package:subreddit_flutter/models/post.dart';
import 'package:subreddit_flutter/screens/home/widgets/postsCardsListView.dart';
import 'package:subreddit_flutter/services/httpService.dart';
import 'package:subreddit_flutter/utils/snackBarHelper.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeBody());
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<Post> posts;

  _HomeBodyState() {
    updatePosts();
  }

  Future updatePosts() {
    return HttpService.getPosts().then((value) {
      setState(() {
        posts = value;
      });
    }).catchError((error) {
      SnackBarHelper.showMessage(context, error);
    });
  }

  Future refreshWasTriggered() async {
    return updatePosts();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "r/FlutterDev",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Expanded(
          child: PostCardsListView(
            posts: posts,
            refreshWasTriggered: refreshWasTriggered,
          ),
        )
      ]),
    );
  }
}
