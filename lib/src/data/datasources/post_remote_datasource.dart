import 'dart:convert';
import '/src/domain/datasources/datasources_interfaces.dart';
import '/src/data/models/models.dart';
import 'package:http/http.dart' as http;

class PostRemoteDataSource implements PostDataSource {

    final String baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<Post>> getPosts() async {
        final response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Post> posts = data.map((json) => Post.fromJson(json)).toList();
      return posts;
    } else {
      throw Exception('Error al obtener los datos');
    }
  }
  
}
