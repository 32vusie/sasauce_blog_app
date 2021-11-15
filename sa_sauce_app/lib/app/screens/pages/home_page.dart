import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa_sauce_app/app/provider/page_provider.dart';
import 'package:sa_sauce_app/app/provider/post_provider.dart';
import 'package:sa_sauce_app/app/utils/constants.dart';
import 'package:sa_sauce_app/app/widgets/article_posts/post_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("SA Sauce"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.search),
              onTap: () {
                Navigator.pushNamed(context, '/blog_search');
              },
            ),
          ),
        ],
      ),
      body: Consumer<PostProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: provider.postResult.length,
              itemBuilder: (context, index) {
                var post = provider.postResult[index];
                return CardPost(postModel: post);
              },
            );
          } else if (provider.state == ResultState.NoData) {
            return Center(
              child: Text(provider.message),
            );
          } else if (provider.state == ResultState.Error) {
            return Center(
              child: Text(provider.message),
            );
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }
}