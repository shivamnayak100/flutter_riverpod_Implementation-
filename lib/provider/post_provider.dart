import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_with_riverpod/models/post_model.dart';
import 'package:state_with_riverpod/repository/post_repository.dart';

  PostRepository postRepository = PostRepository();

final postsProvider = FutureProvider <List<PostModel>>((ref) async{
    try{
    final data = await postRepository.getPostData();
    return data;  
    }catch(e){
      throw "Something error in post provider";
    }

});