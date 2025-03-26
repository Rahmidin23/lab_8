import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/post_bloc.dart';
import 'package:flutter_application_1/pages/post_page.dart';
import 'package:flutter_application_1/repository/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final postRepository = PostRepository();
  runApp(MyApp(postRepository: postRepository));
}

class MyApp extends StatelessWidget {
  final PostRepository postRepository;

  const MyApp({super.key, required this.postRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(postRepository),
      child: MaterialApp(
        title: 'Post Page',
        theme: ThemeData(primarySwatch: Colors.red),
        home: const PostPage(),
      ),
    );
  }
}