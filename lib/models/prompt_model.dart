import 'package:lipread_client/models/chat_model.dart';

class PromptModel {
  final String id;
  final String chatId;
  final String userRole;
  final String assistantRole;
  final String subject;
  final String emoji;
  final List<String> tags;
  final int count;
  final String creatdBy;
  final bool isOfficial;
  final List<ChatModel> chats;

  PromptModel.fromJson(Map<String, dynamic> json)
      : id = json["templateID"],
        chatId = json["roleplayID"] ?? 'none',
        userRole = json["userRole"] ?? 'none',
        assistantRole = json["assistantRole"] ?? 'none',
        subject = json["description"],
        emoji = json["emoji"],
        tags =
            (json["categories"] as List).map((item) => item as String).toList(),
        count = json["usageNum"],
        creatdBy = json["templateCreatorName"],
        isOfficial = json["isOfficial"],
        chats = json["chatList"] == null
            ? []
            : (json["chatList"] as List)
                .map((item) => ChatModel.fromJson(item))
                .toList();
}
