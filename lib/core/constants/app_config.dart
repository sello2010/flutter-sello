import 'package:flutter/foundation.dart' show kIsWeb;

class AppConfig {
  static const String baseUrl =
      kIsWeb ? 'http://127.0.0.1:8000' : 'http://10.0.2.2:8000';
  static const String apiPath = '$baseUrl/api';
  static const String storagePath = '$baseUrl/storage/';
  static const String storageImage = storagePath;
  static const String storageAvatar = '${storagePath}avatars/';
  static const String urlPayment = 'https://app.sandbox.midtrans.com/snap/v2/vtweb/';
}