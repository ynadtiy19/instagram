// class User {
//    String? username;
//   final String name;
//   final String imageUrl;
//   final int followers;
//    final int following;
//     final int posts;
//  final String bio;
//      final List<String> photosImages; // List of photo image paths
//   final List<String> photosDescriptions; // List of photo descriptions
//   final List<String> videosImages; // List of video image paths
//   final List<String> videosDescriptions;

//   User({
//     required this.username,
//     required this.name,
//     required this.imageUrl,
//     required this.followers,
//      required this.following,
//       required this.posts,
//        required this.bio,
//          required this.photosImages,
//       required this.photosDescriptions,
//     required this.videosImages,
//       required this.videosDescriptions,
//   });
// }


class User {
  final String id; // 🔹 أضف معرف المستخدم
  String? username;
  final String name;
  final String imageUrl;
  final int followers;
  final int following;
  final int posts;
  final String bio;
  final List<String> photosImages; // List of photo image paths
  final List<String> photosDescriptions; // List of photo descriptions
  final List<String> videosImages; // List of video image paths
  final List<String> videosDescriptions;

  User({
    required this.id, // ✅ تأكد من تمريره عند إنشاء المستخدم
    required this.username,
    required this.name,
    required this.imageUrl,
    required this.followers,
    required this.following,
    required this.posts,
    required this.bio,
    required this.photosImages,
    required this.photosDescriptions,
    required this.videosImages,
    required this.videosDescriptions,
  });
}
