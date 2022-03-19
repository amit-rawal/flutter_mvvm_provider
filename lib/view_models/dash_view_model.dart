import 'dart:async';

import 'package:flutter_mvvm_provider/base/viewmodels/base_view_model.dart';

import '../models/dashboard/users_response_model.dart';
import '../services/dashboard_services.dart';

class DashboardViewModel extends BaseViewModel {
  String? errorMessage;

  List<Users> _users = [];
  List<Users> get users => _users;

  Future<void> fetchUsers() async {
    changeStatus();
    try {
      var response = await DashboardServices().getUsers();
      if (response.isSuccess) {
        _users = response.data;
      } else {
        errorMessage = response.errorMessage;
      }
    } catch (e) {
      errorMessage = "DashboardViewModel fetchUsers error: ${e.toString()}";
    }
    changeStatus();
  }

  @override
  FutureOr<void> init() async {
    await fetchUsers();
  }
}
