import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sa_sauce_app/app/model/login_model.dart';
import 'package:sa_sauce_app/app/model/post_models.dart';
import 'package:sa_sauce_app/app/model/search_model.dart';
import 'package:sa_sauce_app/app/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

final Completer<WebViewController> controller = Completer<WebViewController>();

class ApiLogin {
  Future<LoginModel> login({
    required String username,
    required String password,
  }) async {
    // Uri uri = Uri.https(Constant.baseUrl, '/jwt-auth/v1/token');
    http.Response _response = await http.post(
      Uri.parse(Constant.baseUrl + '/jwt-auth/v1/token'),
      body: <String, dynamic>{
        'username': username,
        'password': password,
      },
    );
    if (_response.statusCode == 200) {
      final LoginModel responseData = LoginModel.fromJson(_response.body);
      return responseData;
    } else {
      throw Exception("Failed to login!");
    }
  }
}

class ApiPost {
  static final List<PostModel> listPost = [];

  Future<List<PostModel>> getAllPost() async {
    final response =
        await http.get(Uri.parse(Constant.baseUrl + "/wp/v2/posts"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      for (Map<String, dynamic> i in data) {
        listPost.add(PostModel.fromJson(i));
      }
      return listPost;
    } else {
      throw Exception("Failed to load Post");
    }
  }
}

class ApiSearch {
  static final List<SearchModel> listPost = [];

  Future<List<SearchModel>> search(String name) async {
    // Uri uri = Uri.https(Constant.baseUrl, '/jwt-auth/v1/token');
    http.Response _response = await http.get(
      Uri.parse(Constant.baseUrl + '/wp/v2/search?search=$name'),
    );
    if (_response.statusCode == 200) {
      final data = json.decode(_response.body);
      for (Map<String, dynamic> i in data) {
        listPost.add(SearchModel.fromJson(i));
      }
      return listPost;
    } else {
      throw Exception("Failed to login!");
    }
  }
}

class ApiHome {
  static final List<SearchModel> listPost = [];

  Future<List<SearchModel>> search(String name) async {
    // Uri uri = Uri.https(Constant.baseUrl, '/jwt-auth/v1/token');
    http.Response _response = await http.get(
      Uri.parse(Constant.baseUrl + '/wp/v2/search?search=$name'),
    );
    if (_response.statusCode == 200) {
      final data = json.decode(_response.body);
      for (Map<String, dynamic> i in data) {
        listPost.add(SearchModel.fromJson(i));
      }
      return listPost;
    } else {
      throw Exception("Failed to login!");
    }
  }
}
