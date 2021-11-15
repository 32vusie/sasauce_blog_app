import 'package:flutter/cupertino.dart';
import 'package:sa_sauce_app/app/model/post_models.dart';
import 'package:sa_sauce_app/app/utils/api_logic.dart';
import 'package:sa_sauce_app/app/utils/constants.dart';

class PostProvider extends ChangeNotifier {
  final ApiPost? apiPost;

  PostProvider({required this.apiPost}) {
    _fetchAllPost();
  }

  List<PostModel>? _postModel;
  String _message = "";
  ResultState? _state;

  String get message => _message;
  List<PostModel> get postResult => _postModel!;
  ResultState get state => _state!;

  Future<dynamic> _fetchAllPost() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final post = await apiPost!.getAllPost();
      if (post.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = "Data is empty";
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _postModel = post.cast<PostModel>();
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Error to get data from API";
    }
  }
}
