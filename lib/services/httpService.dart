import 'package:dio/dio.dart';
import 'package:subreddit_flutter/constants.dart';
import 'package:subreddit_flutter/models/post.dart';

class HttpService {
  static Future<List<Post>> getPosts() async {
    List<Post> posts = [];

    String url =
        "https://www.reddit.com/r/FlutterDev/hot.json?limit=${Constants.NUMBER_OF_POSTS_TO_SHOW}";

    try {
      Response response = await Dio().get(url);

      for (var child in response.data["data"]["children"]) {
        String title = child["data"]["title"];
        String content = child["data"]["selftext"];

        if (title == null || content == null) {
          return Future.error(Constants.NETWORK_ERROR_MSG);
        }

        posts.add(Post(title: title, content: content));

        // In http request even with limit=20 parameter, the number of posts
        // sometimes exceed this number. There are also pinned posts, that can't
        // be filtered on http request level, so this will enforce it.
        if (posts.length >= Constants.NUMBER_OF_POSTS_TO_SHOW) {
          break;
        }
      }
    } catch (e) {
      return Future.error(Constants.NETWORK_ERROR_MSG);
    }

    return posts;
  }
}
