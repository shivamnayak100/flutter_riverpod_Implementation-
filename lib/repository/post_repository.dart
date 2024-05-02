import 'package:state_with_riverpod/models/post_model.dart';
import 'package:state_with_riverpod/services/post_services.dart';

class PostRepository{
  PostServices postServices = PostServices();
  Future<List<PostModel>> getPostData() async {
    var response = await postServices.getPostList();
    return response;
  }

  Future<List<PostModel>> deletePostItem(int id) async {
    var response = await postServices.deletePostItem(id);
    return response;
  }
}