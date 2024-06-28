import 'package:ai_project/helper/cust_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../helper/global.dart';
import '../model/home_type.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {

    Animate.restartOnHotReload = true;

    return Card(
        // color: Colors.blue.withOpacity(.4),
      color: Theme.of(context).primaryColor.withOpacity(.5),
        shadowColor: Colors.black,
        semanticContainer: true,
        // color: Theme.of(context).focusColor,
        elevation: 3,
        margin: EdgeInsets.only(bottom: mq.height * .02),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          //for ads
          // onTap: () => AdHelper.showInterstitialAd(homeType.onTap),
          onTap: homeType.onTap,
          child: homeType.leftAlign
              ? Row(
            children: [
              //lottie
              Container(
                width: mq.width * .35,
                padding: homeType.padding,
                child: Lottie.asset('assets/lottie/${homeType.lottie}'),
              ),

              const Spacer(),

              //title
              Text(
                homeType.title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),

              const Spacer(flex: 2),
            ],
          )
              : Row(
            children: [
              const Spacer(flex: 2),

              //title
              Text(
                homeType.title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),

              const Spacer(),

              //lottie
              Container(
                width: mq.width * .35,
                padding: homeType.padding,
                child: Lottie.asset('assets/lottie/${homeType.lottie}'),
              ),
            ],
          ),
        )).animate().fade(duration: 2.seconds, curve: Curves.easeIn);
  }
}