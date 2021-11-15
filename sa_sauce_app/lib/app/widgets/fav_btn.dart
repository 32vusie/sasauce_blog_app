import 'package:flutter/material.dart';
import 'package:sa_sauce_app/app/utils/api_logic.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget favoriteButton() {
  return FutureBuilder<WebViewController>(
      future: controller.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return FloatingActionButton(
            onPressed: () async {
              final String url = (await controller.data!.currentUrl())!;
              // ignore: deprecated_member_use
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('Favorited $url')),
              );
            },
            child: const Icon(Icons.favorite),
          );
        }
        return Container();
      });
}
