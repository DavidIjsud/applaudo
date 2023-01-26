import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class NetworkUtils {
  static final String host = dotenv.get("HOST");
  static final String detailHost = dotenv.get("DETAIL_HOST");

  static Future<bool> hasInternetConnection() async {
    try {
      final result =
          await InternetAddress.lookup('developers.mercadolibre.com.bo');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
