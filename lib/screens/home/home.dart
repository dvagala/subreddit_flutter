import 'dart:async';
import 'package:flutter/material.dart';
import 'package:subreddit_flutter/constants.dart';
import 'package:subreddit_flutter/models/post.dart';
import 'package:subreddit_flutter/screens/home/widgets/HomeScreenSliverAppBar.dart';
import 'package:subreddit_flutter/screens/home/widgets/postsCardsSliverList.dart';
import 'package:subreddit_flutter/services/connectivityHelper.dart';
import 'package:subreddit_flutter/services/databaseHelper.dart';
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

  @override
  void initState() {
    super.initState();

    ConnectivityHelper.instance.onConnectionAvailable(() {
      SnackBarHelper.showMessage(context, Constants.BACK_ONLINE_MSG);
      fetchPostsFromInternetOrDB();
    });

    fetchPostsFromInternetOrDB();
  }

  @override
  void dispose() {
    super.dispose();
    ConnectivityHelper.instance.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => fetchPostsFromInternetOrDB(),
        child: CustomScrollView(
          slivers: [
            HomeScreenSliverAppBar(),
            PostCardsSliverList(
              posts: posts,
              refreshWasTriggered: () => updatePostsFromInternet(),
            ),
          ],
        ),
      ),
    );
  }

  Future fetchPostsFromInternetOrDB() {
    return updatePostsFromInternet()
        .then((value) => cachePostsToDB())
        .catchError((noInternetError) {
      DatabaseHelper.instance.getAllPosts().then((value) {
        setState(() {
          posts = value;
        });
      }).catchError((e) {});
      SnackBarHelper.showMessage(context, noInternetError);
    });
  }

  Future updatePostsFromInternet() {
    return HttpService.getPosts().then((value) {
      setState(() {
        posts = value;
      });
    });
  }

  void cachePostsToDB() {
    DatabaseHelper.instance
        .insertPosts(posts)
        .catchError((error) => SnackBarHelper.showMessage(context, error));
  }
}
