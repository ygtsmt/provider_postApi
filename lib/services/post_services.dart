import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend_get_api/models/postmodel.dart';
import 'package:frontend_get_api/models/user_model.dart';
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

class UserService {
  Future<List<UserModel>> getAllUsers() async {
    const urlUsers = 'https://jsonplaceholder.typicode.com/users/';
    final uriUsers = Uri.parse(urlUsers);
    final response = await http.get(uriUsers);
    if (response.statusCode == 200) {
      final jsonUsers = jsonDecode(response.body) as List;
      final users = jsonUsers.map((e) {
        return UserModel(
          id: e["id"],
          name: e["name"],
          username: e["username"],
          email: e["email"],
          address: Address.fromMap(e["address"]),
          phone: e["phone"],
          website: e["website"],
          company: Company.fromMap(e["company"]),
        );
      }).toList();
      return users;
    }
    return [];
  }
}
/*   PostModel.fromMap({required Map json})
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body']; */

  // other options
  /*   PostModel(Map json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body']; */