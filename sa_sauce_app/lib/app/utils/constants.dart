
import 'package:flutter/material.dart';

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
''';

enum MenuOptions {
  showUserAgent,
  listCookies,
  clearCookies,
  addToCache,
  listCache,
  clearCache,
  navigationDelegate,
}

const String homeUrl = 'https://sasauce.co.za/';
const String magazineUrl = 'https://sasauce.co.za/';
const String galaryUrl = 'https://sasauce.co.za/';

class Constant {
  static const String baseUrl = 'https://sasauce.co.za/index.php/wp-json';
  static String _loginToken = '';

  String get token => _loginToken;
  void setToken(token) {
    _loginToken = token;
  }
}

Color whiteColor = const Color(0xFFFFFFFF);
Color semiWhiteColor = const Color(0xFF6b6b6b);
Color greyColor = const Color(0xFF595959);
Color subtitleColor = const Color(0xFFB2B1B9);
Color blueColor = const Color(0xFF323EDD);

enum ResultState { Loading, NoData, HasData, Error }
