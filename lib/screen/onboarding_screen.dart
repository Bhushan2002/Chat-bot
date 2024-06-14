import 'package:ai_project/helper/global.dart';
import 'package:ai_project/model/onboard.dart';
import 'package:ai_project/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    final list = [
      const Onboard(
        title: "Ask me Anything",
        subtitle:
            "I can be your Best Friend an you ask me anything and i will help you!",
        lottie: 'assets/lottie/askAnyThing.json',
      ),
      const Onboard(
          title: "Imagination to reality",
          subtitle:
              "Just imagine anything and let me know, I will create something wonderful for you!",
          lottie: 'assets/lottie/bot.json'),
    ];

    return Scaffold(
        body: PageView.builder(
            controller: controller,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final isLast = index == list.length - 1;
              return Column(
                children: [
                  Lottie.asset(list[index].lottie,
                      height: mq.height * .7,
                      width: isLast ? mq.width * .7 : null),
                  Text(
                    list[index].title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        letterSpacing: .5),
                  ),
                  SizedBox(
                    height: mq.height * .06,
                    width: mq.width * .8,
                    child: Text(
                      list[index].subtitle,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 13.5,
                          letterSpacing: .5,
                          color: Colors.black54),
                    ),
                  ),
                  Wrap(
                    spacing: 10,
                    children: List.generate(
                      2,
                      (i) => Container(
                        width: i == index ? 15 : 10,
                        height: 8,
                        decoration: BoxDecoration(
                          color: i == index ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (isLast) {
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //     builder: (_) => const HomeScreen()));
                        Get.off(()=> const HomeScreen());
                      } else {
                        controller.nextPage(
                            duration:const Duration(milliseconds: 600),
                            curve: Curves.ease);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        elevation: 0,
                        backgroundColor: Colors.lightBlue,
                        minimumSize: Size(mq.width * .4, 50)),
                    child: Text(
                      isLast ? "Finish" : 'Next',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              );
            }));
  }
}
