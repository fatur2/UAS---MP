import 'dart:convert';

import 'package:coba_crud/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://6688719c0ea28ca88b854050.mockapi.io';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/blog'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String title, String content) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/blog'),
          body: {"title": title, "content": content});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
