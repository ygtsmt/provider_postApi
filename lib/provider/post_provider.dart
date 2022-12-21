import 'package:frontend_get_api/models/user_model.dart';
import 'package:frontend_get_api/services/post_services.dart';
import 'package:frontend_get_api/models/postmodel.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  final _service = PostService();
  bool isLoading = false;
  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts; //

  Future<void> getAllPosts() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAllPosts();
    _posts = response;
    isLoading = false;
    notifyListeners();
  }
}

