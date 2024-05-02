import 'package:state_with_riverpod/models/post_model.dart';

abstract class PostState {}

class PostLoading extends PostState {}

class PostData extends PostState {
  final List<PostModel> posts;

  PostData(this.posts);
  
}

class PostError extends PostState {
  final String error;
  PostError(this.error);
}