import 'package:frontend_get_api/model/user_model.dart';
import 'package:frontend_get_api/services/post_services.dart';
import 'package:frontend_get_api/model/postmodel.dart';
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

class UsersProvider extends ChangeNotifier {
  final _service2 = UserService();
  bool isLoadingUsers = false;
  List<UserModel> _users = [];
  List<UserModel> get users => _users; //

  Future<void> getAllUsers() async {
    isLoadingUsers = true;
    notifyListeners();
    final responseUsers = await _service2.getAllUsers();
    _users = responseUsers;
    isLoadingUsers = false;
    notifyListeners();
  }
}
