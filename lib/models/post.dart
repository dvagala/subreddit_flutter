class Post {
  String title;
  String content;

  Post({this.title, this.content});

  String get truncatedContent =>
      content.length > 100 ? content.substring(0, 100) + " ..." : content;
}
