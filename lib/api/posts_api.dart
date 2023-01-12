import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinite_list_tutorial/models/post.dart';

class PostsApi {
  static Future<List<Post>> getPosts(
      [int startIndex = 0, int limit = 20]) async {
    try {
      String url =
          "https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit";

      var response = await http.get(Uri.parse(url));

      List<Post> posts = (json.decode(response.body))
          .map<Post>((jsonPost) => Post.fromJson(jsonPost))
          .toList();

      return posts;
    } catch (e) {
      rethrow;
    }
  }
}
