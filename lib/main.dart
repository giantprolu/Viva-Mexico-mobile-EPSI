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
  bool isProcessing = false;
  final player = AudioPlayer();
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Précharger le son
    player.setSource(AssetSource('mexico.mp3'));

    // Animation scale (effet de tap visuel)
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
    if (isProcessing) return;
    setState(() => isProcessing = true);

    // Animation scale (touche visuelle)
    await _scaleController.reverse();
    await _scaleController.forward();

    setState(() {
      isOpen = !isOpen;
    });

    if (isOpen) {
      await player.stop(); // pour être sûr que rien ne joue
      await player.seek(Duration.zero); // retour au début
      await player.play(AssetSource('mexico.mp3'));
    } else {
      await player.stop();
    }


    setState(() => isProcessing = false);
  }

  @override
  void dispose() {
    player.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: toggleDoor,
        child: Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Porte (ouverte ou fermée)
                Image.asset(
                  isOpen ? 'assets/doorOpen.png' : 'assets/doorClose.png',
                  width: 250,
                ),

                // Mexicain qui sort avec animation
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
