import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/business_logics/models/posts/PostResponseModel.dart';

class HomeViewModel extends ChangeNotifier {
  List<Post> _postList = [];

  addPostToList(Post post) {
    _postList.add(post);
    notifyListeners();
  }

  setPostList(List<Post> postList) {
    _postList = [];
    _postList = postList;
    notifyListeners();
  }

  List<Post> getPostList() {
    return _postList;
  }

// Future<bool> uploadPost(Post post) async {
//   return await ApiService.addPost(post, this);
// }
}
