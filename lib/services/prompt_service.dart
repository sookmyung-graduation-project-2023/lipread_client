import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lipread_client/models/prompt_model.dart';
import 'package:lipread_client/services/api.dart';

class PromptService {
  static Future<List<PromptModel>> getPrompts() async {
    List<PromptModel> promptInstances = [];
    final url = Uri.parse('${API.BASE_URL}/roleplayList/official');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> body =
          jsonDecode(utf8.decode(response.bodyBytes));
      if (body["data"] != null) {
        for (var prompt in body["data"]["roleplayList"]) {
          promptInstances.add(PromptModel.fromJson(prompt));
        }
      }
      return promptInstances;
    }
    throw Error();
  }

  static Future<PromptModel> getPromptById(String id, bool isOfficial) async {
    final url = Uri.parse('${API.BASE_URL}/roleplay/official/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> body =
          jsonDecode(utf8.decode(response.bodyBytes));
      if (body["data"] != null) {
        PromptModel promptInstance = PromptModel.fromJson(body["data"]);
        return promptInstance;
      }
    }
    throw Error();
  }
}
