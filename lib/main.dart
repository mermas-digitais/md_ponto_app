import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:md_ponto_app/src/routes/routes.dart';
import 'package:md_ponto_app/src/ui/screens/home/home.dart';
import 'src/ui/theme/theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await initializeDateFormatting('pt_BR', null);
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mermãs Digitais Ponto app',
      theme: lightTheme(),
      initialRoute: Routes.splash,
      getPages: AppPages.routes,
      unknownRoute: AppPages.routes.first,
      home: const HomePage(),
      locale: const Locale('pt', 'BR'),
      debugShowCheckedModeBanner: false,
    );
  }
}
