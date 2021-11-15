import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa_sauce_app/app/utils/api_logic.dart';
import 'package:sa_sauce_app/app/utils/constants.dart';
import 'package:sa_sauce_app/app/widgets/internet_not_avalable.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Blog extends StatefulWidget {
  final String title;

  const Blog({Key? key, required this.title}) : super(key: key);

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Visibility(
              visible: Provider.of<InternetConnectionStatus>(context) ==
                  InternetConnectionStatus.disconnected,
              child: const InternetNotAvailable()),
          Expanded(
            child: Builder(builder: (BuildContext context) {
              return WebView(
                initialUrl: homeUrl + "?3d-flip-book=sa-sauce-issue-1",
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  controller.complete(webViewController);
                },
                onProgress: (int progress) {
                  print(homeUrl + "issue is loading (progress : $progress%)");
                },
                javascriptChannels: <JavascriptChannel>{
                  _toasterJavascriptChannel(context),
                },
                navigationDelegate: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.youtube.com/')) {
                    print('blocking navigation to $request}');
                    return NavigationDecision.prevent;
                  }
                  print('allowing navigation to $request');
                  return NavigationDecision.navigate;
                },
                onPageStarted: (String url) {
                  print('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  print('Page finished loading: $url');
                },
                gestureNavigationEnabled: true,
              );
            }),
          )
        ],
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
