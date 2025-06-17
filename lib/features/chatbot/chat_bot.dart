import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatResponse {
  final String response;
  ChatResponse({required this.response});
  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(response: json['response']);
  }
}

class Message {
  final String text;
  final bool isUser;
  Message({required this.text, required this.isUser});
}

Future<ChatResponse?> sendMessageToApi(String message) async {
  final url = Uri.parse('https://amira9090-project.hf.space/chat');
  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"message": message}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ChatResponse.fromJson(data);
    }
  } catch (e) {
    print('Exception: $e');
  }
  return null;
}

class ChatBotScreen extends StatefulWidget {
  static final String routeName = "chatbot";
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isSending = false;

  void _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(Message(text: text, isUser: true));
      _controller.clear();
      _isSending = true;
    });

    _scrollToBottom();

    final result = await sendMessageToApi(text);

    if (result != null) {
      setState(() {
        _messages.add(Message(text: result.response, isUser: false));
        _isSending = false;
      });
    } else {
      setState(() {
        _messages.add(Message(text: "No response from server.", isUser: false));
        _isSending = false;
      });
    }

    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 100,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Widget _buildMessage(Message message) {
    final isUser = message.isUser;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isUser)
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.grey.shade300,
                child: Icon(Icons.android, color: Colors.black54, size: 16),
              ),
            if (!isUser) SizedBox(width: 6),
            Flexible(
              child: Card(
                color: isUser ? Colors.blue : Colors.grey.shade200,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(isUser ? 16 : 0),
                    bottomRight: Radius.circular(isUser ? 0 : 16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: isUser ? Colors.white : Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            if (isUser) SizedBox(width: 6),
            if (isUser)
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white, size: 16),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: "Write your message...",
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: _isSending
                  ? CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                  : Icon(Icons.send, color: Colors.white),
              onPressed: _isSending ? null : _sendMessage,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("ChatBot", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) => _buildMessage(_messages[index]),
            ),
          ),
          Divider(height: 1),
          _buildInputArea(),
        ],
      ),
    );
  }
}
