import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MexicoDoorApp());

class MexicoDoorApp extends StatelessWidget {
  const MexicoDoorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viva Mexico',
      debugShowCheckedModeBanner: false,
      home: MexicoDoorPage(),
    );
  }
}

class MexicoDoorPage extends StatefulWidget {
  const MexicoDoorPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MexicoDoorPageState createState() => _MexicoDoorPageState();
}

class _MexicoDoorPageState extends State<MexicoDoorPage> {
  bool isOpen = false;
  final player = AudioPlayer();

  void toggleDoor() async {
    setState(() {
      isOpen = !isOpen;
    });

    if (isOpen) {
      await player.play(AssetSource('mexico.mp3'));
    } else {
      await player.stop();
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: toggleDoor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Porte (ouverte ou fermée)
            Image.asset(
              isOpen ? 'assets/doorOpen.png' : 'assets/doorClose.png',
              width: 250,
            ),

            // Mexicain qui sort
            if (isOpen)
              Positioned(
                bottom: 100,
                child: Image.asset(
                  'assets/mexicain.png',
                  width: 150,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
