import 'package:flutter/material.dart';
import 'package:haptic_feedback_demo/haptic_feedback.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Haptic Feedback Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hapticButton("Success", HapticsType.success),
            hapticButton("Warning", HapticsType.warning),
            hapticButton("Error", HapticsType.error),
            hapticButton("Light", HapticsType.light),
            hapticButton("Medium", HapticsType.medium),
            hapticButton("Rigid", HapticsType.rigid),
            hapticButton("Soft", HapticsType.soft),
            hapticButton("Selection", HapticsType.selection),
          ],
        ),
      ),
    );
  }

  TextButton hapticButton(String title, HapticsType hapticsType) {
    return TextButton(
          onPressed: () async {
            final can = await Haptics.canVibrate();
            if (!can) return;
            await Haptics.vibrate(hapticsType);
          },
          child: Text(title,
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 18,
              )),
        );
  }
}
