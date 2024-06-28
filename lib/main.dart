import 'package:ai_project/helper/cust_theme.dart';
import 'package:ai_project/helper/global.dart';
import 'package:ai_project/helper/pref.dart';
import 'package:ai_project/helper/theme_provider.dart';
import 'package:ai_project/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Pref.initialize();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    ChangeNotifierProvider(create: (context)=> ThemeProvider(),
    child:  const MyApp(),),
     );
}

getApplicationDocumentsDirectory() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      themeMode: ThemeMode.system,
      theme: Provider.of<ThemeProvider>(context).themeDataStyle,
    );
  }
}
