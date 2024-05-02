import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          return Center(
          child: GestureDetector(
            onTap: (){
              // ref.read(postData.notifier).deletePost(PostData());
            },
            child: const Text("Hello Riverpod"))
        );
          }else{
            return const Text("Error on UI");
          }
        },
      ),
    );
  }
}