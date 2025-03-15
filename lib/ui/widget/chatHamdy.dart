import 'package:flutter/material.dart';
import 'package:instgram_app/data/testmodel.dart';
import 'package:instgram_app/ui/dark/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  const ChatScreen({super.key, required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<String> messages = [];

  /// 📌 دالة تُعيد المفتاح المخصص لكل محادثة بناءً على ID المستخدم
  String getChatKey() => 'chat_messages_${widget.user.id ?? "unknown"}';

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  /// 📌 تحميل الرسائل الخاصة بالمستخدم المحدد فقط
  Future<void> _loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      messages = prefs.getStringList(getChatKey()) ?? [];
    });
  }

  /// 📌 إرسال رسالة وتخزينها، مع التمرير التلقائي لآخر رسالة
  Future<void> _sendMessage() async {
    if (_messageController.text.trim().isNotEmpty) {
      final message = _messageController.text.trim();
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        messages.add(message);
      });
      await prefs.setStringList(getChatKey(), messages);
      _messageController.clear();
      _scrollToBottom();
    }
  }

  /// 📌 تمرير الشاشة إلى آخر رسالة
  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
               onTap: () {
                    Navigator.pop(context);
                  },
              child: CircleAvatar(
                backgroundImage: AssetImage(widget.user.imageUrl),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    widget.user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Active now',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.add, color: isDarkMode ? Colors.white : Colors.black),
          const SizedBox(width: 10),
          Icon(Icons.call, color: isDarkMode ? Colors.white : Colors.black),
          const SizedBox(width: 10),
          Icon(Icons.more_vert,
              color: isDarkMode ? Colors.white : Colors.black),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.blueGrey : Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        messages[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          _buildMessageInput(isDarkMode),
        ],
      ),
    );
  }

  /// 📌 شريط إدخال الرسائل
  Widget _buildMessageInput(bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black : Colors.white,
        border: const Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.camera_alt, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Message...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: _sendMessage, // ✅ إرسال الرسالة عند الضغط
          ),
          const Icon(Icons.mic, color: Colors.blue),
          const SizedBox(width: 10),
          const Icon(Icons.image, color: Colors.blue),
          const SizedBox(width: 10),
          const Icon(Icons.emoji_emotions, color: Colors.blue),
          const SizedBox(width: 10),
          const Icon(Icons.add, color: Colors.blue),
        ],
      ),
    );
  }
}
