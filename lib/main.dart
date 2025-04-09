import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import 'dart:async';

void main() => runApp(VieCountdownApp());

class VieCountdownApp extends StatelessWidget {
  const VieCountdownApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown de Vie',
      home: CountdownPage(),
    );
  }
}

class CountdownPage extends StatefulWidget {
  const CountdownPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  DateTime? birthDate;
  DateTime? deathDate;
  Duration? timeLeft;
  Timer? timer;

  void pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        birthDate = date;
        deathDate = DateTime(date.year + 80, date.month, date.day);
      });

      startTimer();
    }
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      final now = DateTime.now();
      setState(() {
        timeLeft = deathDate!.difference(now);
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String formatDuration(Duration d) {
    return "${d.inDays} jours, ${d.inHours % 24}h ${d.inMinutes % 60}m ${d.inSeconds % 60}s";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Countdown de Vie")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (birthDate == null) ...[
              ElevatedButton(
                onPressed: pickDate,
                child: Text("Choisis ta date de naissance"),
              ),
            ] else if (timeLeft != null) ...[
              Text(
                "Temps qu'il te reste à vivre 😱 :",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                formatDuration(timeLeft!),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
