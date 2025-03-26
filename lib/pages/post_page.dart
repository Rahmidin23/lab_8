import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/post_bloc.dart';
import 'package:flutter_application_1/models/get_post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Posts> posts = [];

  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(GetPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadingPostState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FetchedPostsState) {
            posts = state.posts;
            return buildBody();
          }
          return const Center(child: Text("Some Error"));
        },
      ),
    );
  }

  Widget buildBody() {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(posts[index].body),
          ),
        );
      },
    );
  }
}
