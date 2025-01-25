import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 30,
          ),
          title: Text(
            "Ali Hassan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Row(
            children: [
              Icon(Icons.done_all),
              SizedBox(
                width: 5,
              ),
              Text(
                "hi my name is ALi",
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          trailing: Text("18:04"),
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
