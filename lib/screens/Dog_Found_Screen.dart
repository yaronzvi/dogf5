import 'package:flutter/material.dart';
import 'package:dogf5/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class DogFoundScreen extends StatefulWidget {
  static String id = 'DogFoundScreen';
  @override
  _DogFoundScreenState createState() => _DogFoundScreenState();
}

class _DogFoundScreenState extends State<DogFoundScreen> {
  final messageTextController = TextEditingController();
  String messageText;
  int lineNumber = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
        title: Text('News'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  ElevatedButton(
                    autofocus: true,
                    clipBehavior: Clip.none,
                    onPressed: () {
                      messageTextController.clear();
                      lineNumber++;
                      print(messageText);
                      _firestore.collection(kNewsList).add({
                        'contents': messageText,
                        'author': 'yaron',
                        'line': lineNumber
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection(kNewsList).snapshots(),
      builder: (context, snapshot) {
        List<MessageList> messageBubbles = [];
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.lightBlueAccent,
          ));
        } else {
          final messages = snapshot.data.docs.reversed;

          for (var message in messages) {
            final messageData = message.data();
            final messageAuthor = messageData['author'];
            final messageContents = messageData['contents'];
            final messageLine = messageData['line'];

            final messageBubble = MessageList(
              author: messageAuthor,
              contents: messageContents,
              line: messageLine,
            );
            print(messageContents);
            messageBubbles.add(messageBubble);
          }
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageList extends StatelessWidget {
  MessageList({this.author, this.contents, this.line});

  final String author;
  final String contents;
  final int line;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        contents,
        style: TextStyle(fontSize: 15.0, color: Colors.black54),
      ),
    );
  }
}
