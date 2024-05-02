import 'package:state_with_riverpod/models/post_model.dart';
import 'package:state_with_riverpod/services/post_services.dart';

class PostRepository{
  PostServices postServices = PostServices();
  Future<List<PostModel>> getPostData() async {
    var response = await postServices.getPostList();
    return response;
  }
}