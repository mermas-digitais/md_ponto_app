import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:md_ponto_app/src/core/auth/check_login.dart';
import 'package:md_ponto_app/src/core/core.dart';
import 'package:md_ponto_app/src/routes/routes.dart';

import 'src/ui/theme/theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await initializeDateFormatting('pt_BR', null);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
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
      home: checkLogin(),
      locale: const Locale('pt', 'BR'),
      debugShowCheckedModeBanner: false,
    );
  }
}
