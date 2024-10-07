import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../models/chat_message.dart';

class ChatService {
  final WebSocketChannel _channel;

  ChatService(String url) : _channel = WebSocketChannel.connect(Uri.parse(url));

  Stream<ChatMessage> get messageStream {
    return _channel.stream.map((data) {
      final decoded = jsonDecode(data);
      return ChatMessage.fromJson(decoded);
    });
  }

  void sendMessage(ChatMessage message) {
    final jsonMessage = jsonEncode(message.toJson());
    _channel.sink.add(jsonMessage);
  }

  void dispose() {
    _channel.sink.close();
  }
}
