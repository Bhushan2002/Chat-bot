import 'package:ai_project/screen/translation_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/chat_feature.dart';
import '../screen/image_feature.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  //title
  String get title => switch (this) {
    HomeType.aiChatBot => 'AI ChatBot',
    HomeType.aiImage => 'AI Image Creator',
    HomeType.aiTranslator => 'Language Translator',
  };

  //lottie
  String get lottie => switch (this) {
    HomeType.aiChatBot => 'bot.json',
    HomeType.aiImage => 'image-creater.json',
    HomeType.aiTranslator => 'askAnyThing.json',
  };

  //for alignment
  bool get leftAlign => switch (this) {
    HomeType.aiChatBot => true,
    HomeType.aiImage => false,
    HomeType.aiTranslator => true,
  };

  //for padding
  EdgeInsets get padding => switch (this) {
    HomeType.aiChatBot => EdgeInsets.zero,
    HomeType.aiImage => const EdgeInsets.all(20),
    HomeType.aiTranslator => EdgeInsets.zero,
  };


  //for navigation
  VoidCallback get onTap => switch (this) {
    HomeType.aiChatBot => () => Get.to(() =>  ChatBotFeature()),
    HomeType.aiImage => () => Get.to(() =>  ImageFeature()),
    HomeType.aiTranslator => () => Get.to(() =>  TranslationFeature()),
  };
}