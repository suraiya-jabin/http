import 'package:chopper/chopper.dart';

class PostService {
  final ChopperClient client;

  PostService()
      : client = ChopperClient(
    baseUrl: Uri.parse('https://jsonplaceholder.typicode.com'),
    interceptors: [
      HeadersInterceptor({'Custom-Header': 'CustomValue'}),
    ],
    converter: JsonConverter(),
  );

  // Method to fetch posts directly as Map
  Future<List<Map<String, dynamic>>> fetchPosts() async {
    final response = await client.get(Uri.parse('/posts'));

    if (response.isSuccessful) {
      // Return the body directly as a list of maps
      return List<Map<String, dynamic>>.from(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
