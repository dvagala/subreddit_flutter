import 'package:flutter/material.dart';
import 'package:subreddit_flutter/models/post.dart';
import 'package:subreddit_flutter/screens/home/widgets/HomeScreenSliverAppBar.dart';
import 'package:subreddit_flutter/screens/home/widgets/postsCardsSliverList.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => updatePosts(),
        child: CustomScrollView(
          slivers: [
            HomeScreenSliverAppBar(),
            PostCardsSliverList(
              posts: posts,
              refreshWasTriggered: () => updatePosts(),
            ),
          ],
        ),
      ),
    );
  }
}
