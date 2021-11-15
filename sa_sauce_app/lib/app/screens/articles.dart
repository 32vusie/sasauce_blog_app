// class LandingPage extends StatelessWidget {
//   wp.WordPress wordPress = wp.WordPress(
//     baseUrl: 'https://demo.wp-api.org',
//   );

//   _fetchPosts() {
//     Future<List<wp.Post>> posts = wordPress.fetchPosts(
//         postParams: wp.ParamsPostList(
//           context: wp.WordPressContext.view,
//           pageNum: 1,
//           perPage: 10,
//         ),
//         fetchAuthor: true,
//         fetchFeaturedMedia: true,
//         fetchComments: true);

//     return posts;
//   }

//   _getPostImage(wp.Post post) {
//     if (post.featuredMedia == null) {
//       return SizedBox();
//     }
//     return Image.network(post.featuredMedia.sourceUrl);
//   }
// }
