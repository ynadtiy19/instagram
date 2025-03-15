import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instgram_app/data/postHomepagemodel.dart';
import 'package:instgram_app/data/testmodel.dart';
import 'package:instgram_app/ui/other_profile/otheracount.dart';
import 'package:instgram_app/ui/screans/otheracount.dart';

class SeeeeearchPage extends StatefulWidget {
  SeeeeearchPage({this.post});
  Post? post;
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SeeeeearchPage> {
  final List<User> users = [
    User(
      id: '1234',
      username: 'hamdi_mostafa',
      name: 'HamdiMostafa',
      imageUrl: 'assets/images/WhatsApp Image 2025-02-12 at 5.36.25 PM.jpeg',
      followers: 23,
      bio: 'Hamoood',
      posts: 10,
      following: 36,
      photosImages: [
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.43.41 AM.jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.43.44 AM (1).jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.43.44 AM (2).jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.43.44 AM (3).jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.43.44 AM.jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.43.48 AM.jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.43.49 AM (1).jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.43.49 AM (2).jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.43.49 AM (3).jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.43.49 AM (4).jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.43.49 AM.jpeg",
      ],
      photosDescriptions: [
        'blurry lights. deep mind✨🖤',
        'Beauty isn’t about pictures, it’s about who’s looking 🖤✨️',
        '🖤✨',
        'Gentle as usual✨🖤',
        'I don’t sweat, I sparkle✨',
        'A break ',
        'Beauty isn’t about pictures, it’s about who’s looking 🖤✨️',
        '🖤✨',
        'Gentle as usual✨🖤',
        'I don’t sweat, I sparkle✨',
        'A break ',
      ],
      videosImages: [
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.57.39 AM.jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.57.39 AM (5).jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.57.39 AM (4).jpeg",
        'assets/image hamdy/WhatsApp Image 2025-03-05 at 4.57.39 AM (3).jpeg',
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.57.39 AM (2).jpeg",
        "assets/image hamdy/WhatsApp Image 2025-03-05 at 4.57.39 AM (1).jpeg",
        'assets/image hamdy/WhatsApp Image 2025-03-05 at 4.57.38 AM.jpeg',
      ],
      videosDescriptions: [
        'Mybro',
        '',
        'Mybro',
        '',
        'Mybro',
        '',
        'Mybro',
      ],
    ),
    User(
          id: '5678',
      username: 'Salah_ayman',
      name: 'Salah Ayman',
      imageUrl:
          'assets/image salah/WhatsApp Image 2025-03-05 at 5.02.53 AM (2).jpeg',
      bio: '👷🏼‍♂️',
      following: 586,
      posts: 12,
      followers: 1448,
      photosImages: [
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.02.52 AM.jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.02.53 AM (1).jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.02.53 AM (2).jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.02.53 AM (3).jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.02.53 AM (4).jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.02.53 AM (5).jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.02.53 AM (6).jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.02.53 AM (7).jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.02.53 AM (8).jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.02.53 AM.jpeg",
      ],
      photosDescriptions: [
        'blurry lights. deep mind✨🖤',
        'Beauty isn’t about pictures, it’s about who’s looking 🖤✨️',
        '🖤✨',
        'blurry lights. deep mind✨🖤',
        'Beauty isn’t about pictures, it’s about who’s looking 🖤✨️',
        '🖤✨',
        'blurry lights. deep mind✨🖤',
        'Beauty isn’t about pictures, it’s about who’s looking 🖤✨️',
        '🖤✨',
        'Beauty isn’t about pictures, it’s about who’s looking 🖤✨️',
      ],
      videosImages: [
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.10.19 AM.jpeg",
       
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.10.19 AM (3).jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.10.19 AM (2).jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.10.19 AM (1).jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.10.18 AM.jpeg",
        "assets/image salah/WhatsApp Image 2025-03-05 at 5.10.08 AM.jpeg",
      ],
      videosDescriptions: [
        'Mybro',
        'Beauty isn’t about pictures, it’s ',
        '🖤✨',
        'Mybro',
        "",
        'Beauty isn’t about pictures, ',
        'Mybro',
      ],
    ),
  ];

  List<User> filteredUsers = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredUsers = users;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredUsers = users
          .where((user) =>
              user.username!.toLowerCase().contains(query) ||
              user.name.toLowerCase().contains(query))
          .toList();
    });
  }

  void _onUserTap(User user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserrProfilePage(
          user: user,
          photosImages: user.photosImages,
          photosDescriptions: user.photosDescriptions,
          videosImages: user.videosImages,
          videosDescriptions: user.videosDescriptions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Users'.tr()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...'.tr(),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(user.imageUrl),
                  ),
                  title: Text(user.username!),
                  subtitle: Text(user.name),
                  onTap: () => _onUserTap(user),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
