import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/ui/screens/screens.dart';
import 'src/ui/theme/theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Color(0xFF6D62D5),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFFFFFFF),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mermãs Digitais Ponto app',
      theme: lightTheme(),
      home: const HomePage(),
      debugShowCheckedModeBanner: true,
    );
  }
}
