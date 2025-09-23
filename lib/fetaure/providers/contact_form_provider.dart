import 'package:flutter/foundation.dart';
import '../../service/email_service.dart';

class ContactFormProvider extends ChangeNotifier {
  bool _isSending = false;
  bool get isSending => _isSending;

  Future<bool> sendEmail({
    required String serviceId,
    required String templateId,
    required String userId,
    Map<String, dynamic>? templateParams,
    String? accessToken,
  }) async {
    if (_isSending) return false;
    _isSending = true;
    notifyListeners();
    try {
      final ok = await EmailService.send(
        serviceId: serviceId,
        templateId: templateId,
        userId: userId,
        templateParams: templateParams,
        accessToken: accessToken,
      );
      return ok;
    } finally {
      _isSending = false;
      notifyListeners();
    }
  }
}


