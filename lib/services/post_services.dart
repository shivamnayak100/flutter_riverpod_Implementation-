import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:state_with_riverpod/models/post_model.dart';

class PostServices{

  Future<List<PostModel>> getPostList() async {
  try {
    const String url = "https://jsonplaceholder.typicode.com/posts";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<PostModel> postList = data.map((item) => PostModel.fromJson(item)).toList();
      return postList;
    } else {
      throw "Failed to load posts, status code: ${response.statusCode}";
    }
  } catch (e) {
    throw "Error occurred while calling API: $e";
  }
}
}