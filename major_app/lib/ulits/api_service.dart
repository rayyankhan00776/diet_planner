import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = "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";
  static const String model = "Qwen/QwQ-32B-Preview";

  static Future<String> fetchResponse(String userInput) async {
    final url = Uri.parse("https://api-inference.huggingface.co/models/$model");

    try {
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $apiKey",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "inputs": userInput,
          "parameters": {
            "max_new_tokens": 1000, // Set the maximum tokens
          }
        }),
      );

      if (response.statusCode == 200) {
        // Parse the response as a list and extract the generated text
        final data = jsonDecode(response.body);
        if (data is List && data.isNotEmpty) {
          return data[0]["generated_text"] ?? "No response from the server.";
        } else {
          return "Error: Unexpected response format.";
        }
      } else {
        return "Error: ${response.statusCode}. ${response.reasonPhrase}";
      }
    } catch (e) {
      return "Error: Unable to connect to the server. $e";
    }
  }
}
