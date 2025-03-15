class Post {
  final String textname; // Username or title
  final String imagePath; 
    final String imageaccount;// Path to the image
  final String destext; // Description or caption
  int likes; // Number of likes
  bool isLiked; 


  Post({
    required this.textname,
    required this.imagePath,
      required this.imageaccount,
    required this.destext,
   
    this.likes = 0,
    this.isLiked = false,
  });
}