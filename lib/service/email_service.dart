import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailService {
  static const String _endpoint = 'https://api.emailjs.com/api/v1.0/email/send';

  /// Отправка письма через EmailJS API
  /// Возвращает true при успехе (HTTP 200), иначе false
  static Future<bool> send({
    required String serviceId,
    required String templateId,
    required String userId,
    Map<String, dynamic>? templateParams,
    String? accessToken,
  }) async {
    final Map<String, dynamic> payload = <String, dynamic>{
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      if (templateParams != null) 'template_params': templateParams,
      if (accessToken != null) 'accessToken': accessToken,
    };

    final response = await http.post(
      Uri.parse(_endpoint),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );

    return response.statusCode == 200;
  }
}


