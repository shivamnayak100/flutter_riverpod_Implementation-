import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_with_riverpod/models/post_model.dart';
import 'package:state_with_riverpod/provider/post_state.dart';
import 'package:state_with_riverpod/repository/post_repository.dart';

PostRepository postRepository = PostRepository();

final postsProvider = StateNotifierProvider((ref){
    return PostNotifier();
});

class PostNotifier extends StateNotifier<PostState>{
  PostNotifier() : super(PostLoading()) {
    fetchPosts();
  }

  // For fetching list data

   Future<void> fetchPosts() async {
    try {
     final data = await postRepository.getPostData();
      state = PostData(data);
    } catch (e) {
      state = PostError("Something error in post riverpod: $e");
    }
  }

  // For delete list item. 

    Future<void> deletePost(int postId) async{
    if (state is PostData) {
     try{
      final PostData currentState = state as PostData;
      await postRepository.deletePostItem(postId);
      final List<PostModel> updatedPosts = currentState.posts.where((post) => post.id != postId).toList();
      state = PostData(updatedPosts);
     }catch(e){
      state = PostError("Something error in delete riverpod: $e");
     }
    }
  }

  // void addPost(String title) {
  //   if (state is PostData) {
  //     final PostData currentState = state as PostData;
  //     final List<Post> updatedPosts = List.from(currentState.Posts)
  //       ..add(Post(
  //         id: currentState.Posts.length + 1,
  //         title: title,
  //         completed: false,
  //       ));
  //     state = PostData(updatedPosts);
  //   }
  // }

  // void togglePostCompletion(int PostId) {
  //   if (state is PostData) {
  //     final PostData currentState = state as PostData;
  //     final List<Post> updatedPosts = currentState.Posts.map((Post) {
  //       if (Post.id == PostId) {
  //         return Post.copyWith(completed: !Post.completed);
  //       }
  //       return Post;
  //     }).toList();
  //     state = PostData(updatedPosts);
  //   }
  // }



}