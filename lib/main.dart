import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MexicoDoorApp());

class MexicoDoorApp extends StatelessWidget {
  const MexicoDoorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viva Mexico',
      debugShowCheckedModeBanner: false,
      home: const MexicoDoorPage(),
    );
  }
}

class MexicoDoorPage extends StatefulWidget {
  const MexicoDoorPage({super.key});

  @override
  _MexicoDoorPageState createState() => _MexicoDoorPageState();
}

class _MexicoDoorPageState extends State<MexicoDoorPage>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  AudioPlayer? player;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Animation scale (effet visuel de clic)
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
      lowerBound: 0.95,
      upperBound: 1.0,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    );

    _scaleController.value = 1.0;
  }

  void toggleDoor() async {
    setState(() {
      isOpen = !isOpen;
    });

    if (isOpen) {
      // Recrée un nouveau player pour éviter les soucis de relecture
      player?.dispose();
      player = AudioPlayer();
      await player!.play(AssetSource('mexico.mp3'));
    } else {
      await player?.stop();
    }
  }

  @override
  void dispose() {
    player?.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          _scaleController.forward().then((_) {
            _scaleController.reverse();
          });
          toggleDoor();
        },
        child: Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Porte ouverte ou fermée
                Image.asset(
                  isOpen ? 'assets/doorOpen.png' : 'assets/doorClose.png',
                  width: 250,
                ),

                // Apparition du personnage mexicain
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 600),
                  bottom: isOpen ? 100 : -200,
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 600),
                    opacity: isOpen ? 1 : 0,
                    child: Image.asset(
                      'assets/mexicain.png',
                      width: 150,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
