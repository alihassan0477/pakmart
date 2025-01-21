import 'package:flutter/material.dart';
import 'package:pakmart/customWidgets/ChatCard.dart';
import 'package:pakmart/extension/route_extension.dart';
import 'package:pakmart/screens/Chats/IndividualChat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Chats"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => InkWell(
            onTap: () => context.navigateTo(const IndividualChatScreen()),
            child: const ChatCard()),
      ),
    );
  }
}
