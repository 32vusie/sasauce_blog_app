// import 'package:flutter/material.dart';

// class DetailsPage extends StatefulWidget {
//   final String imageUrl, title, desc;
//   const DetailsPage({required this.title, required this.desc, required this.imageUrl});

//   @override
//   _DetailsPageState createState() => _DetailsPageState();
// }

// class _DetailsPageState extends State<DetailsPage> {
//   Widget postContent(htmlContent) {
//     return HtmlView(
//       data: htmlContent, // optional, type String
//       onLaunchFail: (url) {
//         // optional, type Function
//         print("launch $url failed");
//       },
//       scrollable: false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               widget.imageUrl != null
//                   ? Image.network(widget.imageUrl)
//                   : Container(),
//               const SizedBox(height: 8),
//               Text(
//                 widget.title,
//                 style: const TextStyle(fontSize: 18),
//               ),
//               const SizedBox(height: 6),
//               postContent(
//                 widget.desc,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
