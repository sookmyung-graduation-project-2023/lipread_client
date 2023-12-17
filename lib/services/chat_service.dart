import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lipread_client/models/chat_model.dart';
import 'package:lipread_client/services/api.dart';

class ChatService {
  static Future<List<ChatModel>> getChatsById(String id) async {
    List<ChatModel> chatInstances = [];
    final url = Uri.parse('${API.BASE_URL}/roleplay/chatList/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> body =
          jsonDecode(utf8.decode(response.bodyBytes));
      if (body["data"] != null) {
        for (var chat in body["data"]["chatList"]) {
          chatInstances.add(ChatModel.fromJson(chat));
        }
      }
      return chatInstances;
    }
    throw Error();
  }
}
