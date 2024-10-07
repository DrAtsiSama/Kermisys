import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  final String currentUserId;
  final String recipientId;

  ChatScreen({required this.currentUserId, required this.recipientId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  late WebSocketChannel channel;
  List<Map<String, String>> messages = [];

  @override
  void initState() {
    super.initState();

    // Initialise le WebSocket avec l'URL correcte
    channel = WebSocketChannel.connect(
      Uri.parse('ws://217.69.9.54:8080/ws/private?userID=${widget.recipientId}'),
    );

    print('Connexion WebSocket établie avec ws://217.69.9.54:8080/ws/private?userID=${widget.recipientId}');

    // Écoute les messages entrants
    channel.stream.listen((message) {
      print('Message reçu du serveur : $message');
      setState(() {
        Map<String, dynamic> decodedMessage = jsonDecode(message);
        print('Message décodé : $decodedMessage');
        messages.add({
          'sender_id': decodedMessage['sender_id'],
          'content': decodedMessage['content'],
        });
      });
    }, onError: (error) {
      print('Erreur WebSocket : $error');
    }, onDone: () {
      print('Connexion WebSocket terminée');
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      // Format du message envoyé
      final message = {
        'sender_id': widget.currentUserId,
        'receiver_id': widget.recipientId,
        'content': _messageController.text,
      };

      print('Envoi du message : $message');

      // Envoi du message sous format JSON
      channel.sink.add(jsonEncode(message));

      // Ajoute le message à l'interface pour l'envoyeur
      setState(() {
        messages.add({
          'sender_id': widget.currentUserId,
          'content': _messageController.text,
        });
      });

      _messageController.clear();
    } else {
      print('Message vide, non envoyé');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat avec ${widget.recipientId}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message['sender_id'] == widget.currentUserId;
                print('Affichage du message : ${message['content']} de ${message['sender_id']}');
                return ListTile(
                  title: Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message['content'] ?? '',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: 'Tapez votre message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
