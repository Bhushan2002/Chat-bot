import 'package:ai_project/helper/app_bar.dart';
import 'package:ai_project/helper/cust_theme.dart';
import 'package:ai_project/helper/global.dart';
import 'package:ai_project/helper/pref.dart';
import 'package:ai_project/helper/theme_provider.dart';
import 'package:ai_project/screen/home_card.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model/home_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: customAppBar(context, appName),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .04, vertical: mq.height * .015),
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      ),

    );
  }
}
