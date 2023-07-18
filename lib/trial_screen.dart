import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:three_day_trial/trial_manager.dart';

class TrialScreen extends StatefulWidget {
  final SharedPreferences prefs;

  TrialScreen({required this.prefs});

  @override
  _TrialScreenState createState() => _TrialScreenState();
}

class _TrialScreenState extends State<TrialScreen> {
  TrialManager trialManager = TrialManager();

  void _startTrialButtonPressed() {
    trialManager.startTrial(widget.prefs);
    setState(() {});
  }

  void _checkTrialStatus() {
    bool isTrialActive = trialManager.isTrialActive(widget.prefs);
    if (isTrialActive) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Trial Status'),
          content: Text('Your trial is still active.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Trial Status'),
          content: Text('Your trial has expired.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trial App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _startTrialButtonPressed,
              child: Text('Start 3-Day Trial'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkTrialStatus,
              child: Text('Check Trial Status'),
            ),
          ],
        ),
      ),
    );
  }
}
