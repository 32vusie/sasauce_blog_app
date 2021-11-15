import 'package:flutter/cupertino.dart';
import 'package:sa_sauce_app/app/utils/api_logic.dart';
import 'package:sa_sauce_app/app/utils/constants.dart';
import '../model/search_model.dart';

class SearchProvider extends ChangeNotifier {
  final ApiSearch? apiSearch;

  SearchProvider({required this.apiSearch}) {
    _fetchSearchPost();
  }

  List<SearchModel>? _searchModel;
  String _message = "";
  ResultState? _state;
  String name = '';

  String get message => _message;
  List<SearchModel> get postResult => _searchModel!;
  ResultState get state => _state!;

  void setName(String value) {
    name = value;
    notifyListeners();
    _fetchSearchPost();
  }

  Future<dynamic> _fetchSearchPost() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final post = await apiSearch!.search(name);
      if (post.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = "Data is empty";
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _searchModel = post.cast<SearchModel>();
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Error to get data from API";
    }
  }
}
