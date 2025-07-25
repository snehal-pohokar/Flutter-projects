import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to send message
  void sendMessage() {
    if (_controller.text.isNotEmpty) {
      String userMessage = _controller.text;

      // Add user's message to Firestore
      _firestore.collection('chats').add({
        'message': userMessage,
        'sender': 'User', // Hardcoded sender for now
        'timestamp': FieldValue.serverTimestamp(),
        'reply': null, // Initially no reply
      }).then((_) {
        // Simulate chatbot reply after user's message is added
        _sendBotReply(userMessage);
      });

      // Clear the input field
      _controller.clear();
    }
  }

  // Function to simulate a bot reply (replace with actual bot logic or API)
  void _sendBotReply(String userMessage) {
    String botReply = "Bot: I didn't understand your message.";
    if (userMessage.toLowerCase().contains("hello")) {
      botReply = "Bot: Hello! How can I help you today?";
    } else if (userMessage.toLowerCase().contains("help")) {
      botReply = "Bot: I can assist you with various queries. What do you need help with?";
    }

    // Add bot reply to Firestore
    _firestore.collection('chats').add({
      'message': botReply,
      'sender': 'Bot',
      'timestamp': FieldValue.serverTimestamp(),
      'reply': true, // Indicate this is a bot reply
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Chatbot'),
      ),
      body: Column(
        children: [
          // StreamBuilder to display messages
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
  stream: _firestore
      .collection('chats')
      .orderBy('timestamp')
      .snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
    }

    final messages = snapshot.data!.docs;
    List<Widget> messageWidgets = [];
    for (var message in messages) {
      final messageText = message['message'] ?? '';  // Fallback if 'message' is null
      final sender = message['sender'] ?? '';  // Fallback if 'sender' is null
      final isReply = message['reply'] ?? false;  // Safely handle missing 'reply' field

      final messageWidget = ListTile(
        title: Text(sender),
        subtitle: Text(messageText),
        tileColor: isReply ? Colors.lightGreen[50] : Colors.white,
      );

      messageWidgets.add(messageWidget);
    }

    return ListView(
      children: messageWidgets,
    );
  },
)

          ),

          // Input field and send button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}