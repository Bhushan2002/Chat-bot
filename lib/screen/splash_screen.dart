import 'package:ai_project/helper/global.dart';
import "package:ai_project/helper/pref.dart";
import "package:ai_project/screen/home_screen.dart";
import "package:ai_project/screen/onboarding_screen.dart";
import "package:ai_project/widget/custom_loading.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (_) => Pref.showOnboarding
      //         ? const OnboardingScreen()
      //         : const HomeScreen(),
      //   ),
      // );
      Get.off(
        () =>
            Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Card(
              color: Colors.white70,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: mq.width * .45,
                ),
              ),
            ),
            Spacer(),
            CustomLoading(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
