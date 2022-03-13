import 'package:flutter/material.dart';

import '../models/base_model/base_response_model.dart';
import '../models/home/user_post_response_model.dart';
import '../repository/user_post_repository.dart';
import '../utility/helpers/APIHelper/api_response_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<Posts> _postList = [];

  ValueNotifier<Posts> viewModelNotifier =
      ValueNotifier(Posts(apiStatus: APIStatus.idle));

  fetchPosts() async {
    viewModelNotifier =
        ValueNotifier(Posts(apiStatus: APIStatus.loading));
    try {

      var responseObject = await PostRepository().getUserPosts();

      if (responseObject is Success) {

       List <Map<String, dynamic>> postList = responseObject.response as List <Map<String, dynamic>>;

        List<Posts> posts = List<Posts>.from(
            postList.map((x) => Posts.fromJson(x)));

        viewModelNotifier.value =
            Posts(,apiStatus: APIStatus.completed);

      }
      if (responseObject is Failure) {
        viewModelNotifier.value = Posts(
            apiStatus: APIStatus.error, message: responseObject.errorResponse.toString());
      }


    } catch (e) {
      viewModelNotifier.value = Posts(
          apiStatus: APIStatus.error, message: e.toString());
    }
  }
}
