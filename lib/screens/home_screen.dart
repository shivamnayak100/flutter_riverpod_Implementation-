import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_with_riverpod/provider/post_provider.dart';
import 'package:state_with_riverpod/provider/post_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Hello Riverpod"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(postsProvider);
          if(state is PostLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is PostData){
        return ListView.builder(
        itemCount: state.posts.length,
        itemBuilder: (context, index) {
          final post = state.posts[index];
          return ListTile(
            title: Text(post.title),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async{
                await ref.read(postsProvider.notifier).deletePost(post.id);
              },
            ),
          );
        }
        );
          }else{
            return const Center(child:  Text("Error on UI"));
          }
        },
      ),
    );
  }
}