// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sa_sauce_app/app/provider/login_provider.dart';
// import 'package:sa_sauce_app/app/widgets/article_posts/scaffold_theme.dart';
// import 'package:sa_sauce_app/app/widgets/article_posts/submit_button.dart';
// import 'package:sa_sauce_app/app/widgets/article_posts/text_field_input.dart';


// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     final TextEditingController username = TextEditingController();
//     final TextEditingController password = TextEditingController();

//     return ScaffoldTheme(
//       title: 'Login Page',
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFieldInput(
//                 obscureText: false,
//                 label: 'Username',
//                 text: username,
//                 validator: (String? value) {
//                   if (value?.isEmpty ?? true) return 'required';
//                 },
//               ),
//               const SizedBox(height: 15),
//               TextFieldInput(
//                 obscureText: true,
//                 label: 'Password',
//                 text: password,
//                 validator: (String? value) {
//                   if (value?.isEmpty ?? true) return 'required';
//                 },
//               ),
//               const SizedBox(height: 15),
//               SubmitButton(
//                 title: 'Login',
//                 icon: Icons.send,
//                 onTap: () {
//                   // validate form
//                   if (!(_formKey.currentState?.validate() ?? false)) return;
//                   // get provider read
//                   LoginProvider provider = context.read<LoginProvider>();
//                   provider.getLogin(username.text, password.text);
//                   // navigate back
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
