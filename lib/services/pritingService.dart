class Logger {
  static const bool showLogs = true;

  static void logS(String message, String functionName) {
    if (showLogs) {
      print('✅ ' + functionName + "➡️" + message);
    }
  }

  static void logW(String message, String functionName) {
    if (showLogs) {
      print('🟡 ' + functionName + "➡️" + message);
    }
  }

  static void logE(String message, String functionName) {
    if (showLogs) {
      print('❌ ' + functionName + "➡️" + message);
    }
  }

  static void logI(String message, String functionName) {
    if (showLogs) {
      print('ℹ️ ' + functionName + "➡️" + message);
    }
  }

  static void logU(String message, String functionName) {
    if (showLogs) {
      print('🔥 ' + functionName + "➡️" + message);
    }
  }
}
