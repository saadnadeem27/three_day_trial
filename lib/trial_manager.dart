import 'package:shared_preferences/shared_preferences.dart';

class TrialManager {
  void startTrial(SharedPreferences prefs) {
    DateTime now = DateTime.now();
    prefs.setString('trialStart', now.toIso8601String());
  }

  bool isTrialActive(SharedPreferences prefs) {
    String? trialStart = prefs.getString('trialStart');
    if (trialStart != null) {
      DateTime startDateTime = DateTime.parse(trialStart);
      DateTime now = DateTime.now();
      Duration difference = now.difference(startDateTime);
      return difference.inDays < 3;
    }
    return false;
  }
}
