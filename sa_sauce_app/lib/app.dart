import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:sa_sauce_app/app/screens/article_posts/blog_list.dart';
import 'package:sa_sauce_app/app/screens/article_posts/main_post.dart';
import 'package:sa_sauce_app/app/screens/contact.dart';
import 'package:sa_sauce_app/app/screens/home.dart';
import 'package:sa_sauce_app/app/screens/price_list.dart';
import 'package:sa_sauce_app/app/utils/api_logic.dart';
import 'package:sa_sauce_app/app/widgets/controller.dart';
// import 'package:sa_sauce_app/app/app/screens/about.dart';
// import 'package:sa_sauce_app/app/app/screens/splash/splash_screen.dart';

// import 'app/core/connection.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<InternetConnectionStatus>(
      initialData: InternetConnectionStatus.connected,
      create: (_) {
        return InternetConnectionChecker().onStatusChange;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        
        home: const MyHomePage(
          title: '',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    const Home(
      title: 'Home',
    ),
    const Posts2Page(
      // title: 'Magazine',
    ),
    const BlogList(
        // title: 'Magazine',
    ),
    const PriceList(
      title: 'Price List',
    ),
    const Contact()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(widget.title),
      //     // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
      //     actions: <Widget>[
      //       NavigationControls(controller.future),
      //     ]),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
        // initialRoute: '/blog_list',
        // routes: {
        //   // '/splash_screen': (context) => const SplashScreen(),
        //   '/blog_list': (context) => const BlogList(),
        //   '/login_page': (context) => const LoginPage(),
        //   '/blog_search': (context) => const BlogSearch(),
        // },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            title: Text('Magazines'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            title: Text('Prices'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            title: Text('Contact'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
