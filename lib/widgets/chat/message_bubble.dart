import 'package:flutter/material.dart';
import 'dart:math';

class MessageBubble extends StatelessWidget {
  final _username;
  final _message;
  final _isMe;
  final key;
  final userImageUrl;

  MessageBubble(this._message, this._username, this.userImageUrl, this._isMe,
      {this.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment:
          _isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        if (!_isMe)
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImageUrl),
            ),
          ),
        Container(
          decoration: BoxDecoration(
            color: _isMe ? Colors.pink[100] : Colors.white30,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft:
                  !_isMe ? const Radius.circular(0) : const Radius.circular(12),
              bottomRight:
                  _isMe ? const Radius.circular(0) : const Radius.circular(12),
            ),
          ),
          width: 180,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (!_isMe)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    _username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
                ),
              Text(
                _message,
                style: const TextStyle(
                  height: 1.2,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        if (_isMe)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundImage:
                  userImageUrl != null ? NetworkImage(userImageUrl) : null,
            ),
          ),
      ],
    );
  }
}
