import 'package:flutter/material.dart';
import 'Teams_Class/ClassTeam.dart';

class WinnerPage extends StatelessWidget {
  final Team winner;

  const WinnerPage({Key? key, required this.winner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LFG'),
      ),
      body: SingleChildScrollView(
        // Wrap content in a SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Congratulations to ${winner.name}!',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset(
                winner.winImagePath,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Go back to the previous screen
                },
                child: const Text('Back to Selection'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
