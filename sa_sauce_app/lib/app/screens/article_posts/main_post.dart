import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sa_sauce_app/app/provider/login_provider.dart';
import 'package:sa_sauce_app/app/provider/post_provider.dart';
import 'package:sa_sauce_app/app/provider/search_provider.dart';
import 'package:sa_sauce_app/app/screens/article_posts/blog_list.dart';
import 'package:sa_sauce_app/app/screens/article_posts/blog_search.dart';
import 'package:sa_sauce_app/app/screens/login_page.dart';
import 'package:sa_sauce_app/app/utils/api_logic.dart';

class Posts2Page extends StatefulWidget {
  const Posts2Page({Key? key}) : super(key: key);

  @override
  _Posts2PageState createState() => _Posts2PageState();
}

class _Posts2PageState extends State<Posts2Page> {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
    ChangeNotifierProvider(
      create: (BuildContext context) => PostProvider(
        apiPost: ApiPost(),
      ),
    ),
    ChangeNotifierProvider(
      create: (BuildContext context) => LoginProvider(
        apiLogin: ApiLogin(),
      ),
    ),
    ChangeNotifierProvider(
      create: (BuildContext context) => SearchProvider(
        apiSearch: ApiSearch(),
      ),
    ),
    // ChangeNotifierProvider(
    //   create: (BuildContext context) => PostsPage(
    //     apiSearch: ApiSearch(),
      // ),
    // ),
      ],
      builder: (
    BuildContext context,
    Widget? child,
      ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/blog_list',
      routes: {
        // '/splash_screen': (context) => const SplashScreen(),
        '/blog_list': (context) => const BlogList(),
        '/login_page': (context) => const LoginPage(),
        '/blog_search': (context) => const BlogSearch(),
      },
    );
      },
    );
    // );
  }
}

// class PostsPage extends StatelessWidget {
//   const PostsPage({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (BuildContext context) => PostProvider(
//             apiPost: ApiPost(),
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (BuildContext context) => LoginProvider(
//             apiLogin: ApiLogin(),
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (BuildContext context) => SearchProvider(
//             apiSearch: ApiSearch(),
//           ),
//         ),
//         // ChangeNotifierProvider(
//         //   create: (BuildContext context) => PostsPage(
//         //     apiSearch: ApiSearch(),
//           // ),
//         // ),
//       ],
//       builder: (
//         BuildContext context,
//         Widget? child,
//       ) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
//             brightness: Brightness.dark,
//           ),
//           initialRoute: '/blog_list',
//           routes: {
//             // '/splash_screen': (context) => const SplashScreen(),
//             '/blog_list': (context) => const BlogList(),
//             '/login_page': (context) => const LoginPage(),
//             '/blog_search': (context) => const BlogSearch(),
//           },
//         );
//       },
//     );
//   }
// }
