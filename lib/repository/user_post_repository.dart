import '../models/home/user_post_request_model.dart';
import '../utility/helpers/APIHelper/api_manager.dart';

class PostRepository {
  Future<Object> getUserPosts() async {
    final obj = await APIManager.sharedInstance.sendRequest(PostRequestModel());
    return obj;
  }
}
