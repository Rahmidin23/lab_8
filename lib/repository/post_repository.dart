import 'dart:convert';
import 'package:flutter_application_1/models/get_post.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Posts>> getPosts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Posts.fromJson(json)).toList();
      } else {
        throw Exception("Failed to fetch posts");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
