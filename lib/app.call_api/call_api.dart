import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class Posts {
  static String baseUrl = "https://jsonplaceholder.typicode.com";

  static Future<List> getAllPosts() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return Future.error("Server error");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
