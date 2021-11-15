import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: const Text('Contact Us'),

          ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ContactUs(
              cardColor: Colors.white,
              textColor: Colors.black,
              logo: const AssetImage('assets/images/logo_white.png'),
              email: 'info@sasauce.co.za',
              companyName: 'SA SAUCE Pty Ltd',
              companyColor: Colors.white,
              dividerThickness: 2,
              phoneNumber: '+27 61 434 7180',
              website: 'https://sasauce.co.za/',
              // githubUserName: 'AbhishekDoshi26',
              // linkedinURL:
              //     'https://www.linkedin.com/in/abhishek-doshi-520983199/',
              tagLine: 'Publication and Marketing Comapany',
              taglineColor: Colors.white,
              // twitterHandle: 'AbhishekDoshi26',
              instagram: '@sasauce',
              facebookHandle: 'SA Sauce'),
        ),
      )
    
    );
  }
}
