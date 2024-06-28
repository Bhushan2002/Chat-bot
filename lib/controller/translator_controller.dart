// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../apis/apis.dart';
// import '../helper/my_dialog.dart';
//
//
// enum Status {none, loading, complete}
//
//
//
// class TranslateController extends GetxController{
//   final textController = TextEditingController();
//   final resultController = TextEditingController();
//   final status = Status.none.obs;
//   final from = ''.obs, to = ''.obs;
//
// // final lang = const [
// //   "Afar",
// //   "Abkhazian",
// //   "Avestan",
// //   "Afrikaans",
// //   "Akan",
// //   "Amharic",
// //   "Aragonese",
// //   "Arabic",
// //   "Assamese",
// //   "Avaric",
// //   "Aymara",
// //   "Azerbaijani",
// //   "Bashkir",
// //   "Belarusian",
// //   "Bulgarian",
// //   "Bihari languages",
// //   "Bislama",
// //   "Bambara",
// //   "Bengali",
// //   "Tibetan",
// //   "Breton",
// //   "Bosnian",
// //   "Catalan",
// //   "Chechen",
// //   "Chamorro",
// //   "Corsican",
// //   "Cree",
// //   "Czech",
// //   "Church Slavic",
// //   "Chuvash",
// //   "Welsh",
// //   "Danish",
// //   "German",
// //   "Maldivian",
// //   "Dzongkha",
// //   "Ewe",
// //   "Greek",
// //   "English",
// //   "Esperanto",
// //   "Spanish",
// //   "Estonian",
// //   "Basque",
// //   "Persian",
// //   "Fulah",
// //   "Finnish",
// //   "Fijian",
// //   "Faroese",
// //   "French",
// //   "Western Frisian",
// //   "Irish",
// //   "Gaelic",
// //   "Galician",
// //   "Guarani",
// //   "Gujarati",
// //   "Manx",
// //   "Hausa",
// //   "Hebrew",
// //   "Hindi",
// //   "Hiri Motu",
// //   "Croatian",
// //   "Haitian",
// //   "Hungarian",
// //   "Armenian",
// //   "Herero",
// //   "Interlingua",
// //   "Indonesian",
// //   "Interlingue",
// //   "Igbo",
// //   "Sichuan Yi",
// //   "Inupiaq",
// //   "Ido",
// //   "Icelandic",
// //   "Italian",
// //   "Inuktitut",
// //   "Japanese",
// //   "Javanese",
// //   "Georgian",
// //   "Kongo",
// //   "Kikuyu",
// //   "Kuanyama",
// //   "Kazakh",
// //   "Kalaallisut",
// //   "Central Khmer",
// //   "Kannada",
// //   "Korean",
// //   "Kanuri",
// //   "Kashmiri",
// //   "Kurdish",
// //   "Komi",
// //   "Cornish",
// //   "Kirghiz",
// //   "Latin",
// //   "Luxembourgish",
// //   "Ganda",
// //   "Limburgan",
// //   "Lingala",
// //   "Lao",
// //   "Lithuanian",
// //   "Luba-Katanga",
// //   "Latvian",
// //   "Malagasy",
// //   "Marshallese",
// //   "Maori",
// //   "Macedonian",
// //   "Malayalam",
// //   "Mongolian",
// //   "Marathi",
// //   "Malay",
// //   "Maltese",
// //   "Burmese",
// //   "Nauru",
// //   "Norwegian",
// //   "North Ndebele",
// //   "Nepali",
// //   "Ndonga",
// //   "Dutch",
// //   "South Ndebele",
// //   "Navajo",
// //   "Chichewa",
// //   "Occitan",
// //   "Ojibwa",
// //   "Oromo",
// //   "Oriya",
// //   "Ossetic",
// //   "Panjabi",
// //   "Pali",
// //   "Polish",
// //   "Pushto",
// //   "Portuguese",
// //   "Quechua",
// //   "Romansh",
// //   "Rundi",
// //   "Romanian",
// //   "Russian",
// //   "Kinyarwanda",
// //   "Sanskrit",
// //   "Sardinian",
// //   "Sindhi",
// //   "Northern Sami",
// //   "Sango",
// //   "Sinhala",
// //   "Slovak",
// //   "Slovenian",
// //   "Samoan",
// //   "Shona",
// //   "Somali",
// //   "Albanian",
// //   "Serbian",
// //   "Swati",
// //   "Sotho, Southern",
// //   "Sundanese",
// //   "Swedish",
// //   "Swahili",
// //   "Tamil",
// //   "Telugu",
// //   "Tajik",
// //   "Thai",
// //   "Tigrinya",
// //   "Turkmen",
// //   "Tagalog",
// //   "Tswana",
// //   "Tonga",
// //   "Turkish",
// //   "Tsonga",
// //   "Tatar",
// //   "Twi",
// //   "Tahitian",
// //   "Uighur",
// //   "Ukrainian",
// //   "Urdu",
// //   "Uzbek",
// //   "Venda",
// //   "Vietnamese",
// //   "Volapük",
// //   "Walloon",
// //   "Wolof",
// //   "Xhosa",
// //   "Yiddish",
// //   "Yoruba",
// //   "Zhuang",
// //   "Chinese",
// //   "Zulu"
// // ];
//   Future<void> translate() async {
//     if (textController.text.trim().isNotEmpty && to.isNotEmpty) {
//       status.value = Status.loading;
//
//       String prompt = '';
//
//       if (from.isNotEmpty) {
//         prompt =
//         'Can you translate given text from ${from.value} to ${to.value}:\n${textController.text}';
//       } else {
//         prompt = 'Can you translate given text to ${to.value}:\n${textController.text}';
//       }
//
//       log(prompt);
//
//       final res = await APIs.getAnswer(prompt);
//       resultController.text = utf8.decode(res.codeUnits);
//
//       status.value = Status.complete;
//     } else {
//       status.value = Status.none;
//       if (to.isEmpty) MyDialog.info('Select To Language!');
//       if (textController.text.isEmpty) MyDialog.info('Type Something to Translate!');
//     }
//   }
//
//   void swapLanguages() {
//     if (to.isNotEmpty && from.isNotEmpty) {
//       final t = to.value;
//       to.value = from.value;
//       from.value = t;
//     }
//   }
//
//   Future<void> googleTranslate() async {
//     if (textController.text.trim().isNotEmpty && to.isNotEmpty) {
//       status.value = Status.loading;
//
//       resultController.text = await APIs.googleTranslate(
//           from: jsonLang[from.value] ?? 'auto',
//           to: jsonLang[to.value] ?? 'en',
//           text: textController.text);
//
//       status.value = Status.complete;
//     } else {
//       status.value = Status.none;
//       if (to.isEmpty) MyDialog.info('Select To Language!');
//       if (textController.text.isEmpty) {
//         MyDialog.info('Type Something to Translate!');
//       }
//     }
//   }
//
//   late final lang = jsonLang.keys.toList();
//
//
//
// }