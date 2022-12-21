import 'dart:convert';
import 'package:frontend_get_api/model/postmodel.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<List<PostModel>> getAllPosts() async {
    const url = 'https://jsonplaceholder.typicode.com/posts/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final posts = json.map((e) {
        return PostModel(
          id: e['id'],
          userId: e['userId'],
          title: e['title'],
          body: e['body'],
        );
      }).toList();
      return posts;
    }
    return [];
  }
}
