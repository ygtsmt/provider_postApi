
import 'package:flutter/material.dart';
import 'package:frontend_get_api/services/post_services.dart';

import '../models/user_model.dart';

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