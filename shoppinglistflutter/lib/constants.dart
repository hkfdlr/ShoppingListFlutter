import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

class Constants  {

  static isMobile() {
    if (kIsWeb) {
      return false;
    } else {
      try {
        return Platform.isAndroid || Platform.isIOS;
      } catch(e) {
        throw e;
      };
    }
  }
}