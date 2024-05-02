import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_with_riverpod/provider/post_provider.dart';

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
          final postData = ref.watch(postsProvider);
          print("####################### UI Implementation--- ${postData}");
          return const Center(
          child: Text("Hello Riverpod")
        );
        },
      ),
    );
  }
}