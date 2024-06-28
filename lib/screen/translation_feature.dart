// import 'package:ai_project/controller/translator_controller.dart';
// import 'package:ai_project/widget/language_sheet.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:translator_plus/translator_plus.dart';
//
// import '../helper/global.dart';
// import '../widget/custom_btn.dart';
// import '../widget/custom_loading.dart';
//
// class TranslationFeature extends StatefulWidget {
//   const TranslationFeature({super.key});
//
//   @override
//   State<TranslationFeature> createState() => _TranslationFeatureState();
// }
//
// class _TranslationFeatureState extends State<TranslationFeature> {
//   final _c = TranslateController();
// final  translated_text = '';
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Translator'),
//       ),
//       body: ListView(
//         physics: BouncingScrollPhysics(),
//         padding: EdgeInsets.only(
//           top: mq.height * .02,
//           bottom: mq.height * .1,
//           left: mq.width * .04,
//           right: mq.width * .04,
//         ),
//         children: [
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             //from language
//             InkWell(
//               onTap: () => Get.bottomSheet(LanguageSheet(c: _c, s: _c.from)),
//               borderRadius: const BorderRadius.all(Radius.circular(15)),
//               child: Container(
//                 height: 50,
//                 width: mq.width * .4,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blue),
//                     borderRadius: const BorderRadius.all(Radius.circular(15))),
//                 child:
//                 Obx(() => Text(_c.from.isEmpty ? 'Auto' : _c.from.value)),
//               ),
//             ),
//
//             //swipe language btn
//             IconButton(
//                 onPressed: _c.swapLanguages,
//                 icon: Obx(
//                       () => Icon(
//                     CupertinoIcons.repeat,
//                     color: _c.to.isNotEmpty && _c.from.isNotEmpty
//                         ? Colors.blue
//                         : Colors.grey,
//                   ),
//                 )),
//
//             //to language
//             InkWell(
//               onTap: () => Get.bottomSheet(LanguageSheet(c: _c, s: _c.to)),
//               borderRadius: const BorderRadius.all(Radius.circular(15)),
//               child: Container(
//                 height: 50,
//                 width: mq.width * .4,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blue),
//                     borderRadius: const BorderRadius.all(Radius.circular(15))),
//                 child: Obx(() => Text(_c.to.isEmpty ? 'To' : _c.to.value)),
//               ),
//             ),
//           ]),
//
//           //text field
//           Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: mq.width * .04, vertical: mq.height * .035),
//             child: TextFormField(
//               onChanged: (text) async{
//                 text.translate(
//                   from: 'en',
//                   to: 'hi'
//                 );
//                 setState(() {
//                   text = translated_text;
//                 });
//               },
//               controller: _c.textController,
//               minLines: 5,
//               maxLines: null,
//               onTapOutside: (e) => FocusScope.of(context).unfocus(),
//               decoration: const InputDecoration(
//                   hintText: 'Translate anything you want...',
//                   hintStyle: TextStyle(fontSize: 13.5),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)))),
//             ),
//           ),
//
//           Text(translated_text),
//
//           //result field
//           // Obx(() => _translateResult()),
//
//
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
//             child: TextFormField(
//               controller: _c.resultController,
//               maxLines: null,
//               onTapOutside: (e) => FocusScope.of(context).unfocus(),
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)))),
//             ),
//           ),
//           SizedBox(height: mq.height * .04),
//
//           //translate btn
//           CustomBtn(
//             onTap: _c.googleTranslate,
//             // onTap: _c.translate,
//             text: 'Translate',
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _translateResult() => switch (_c.status.value) {
//     Status.none => const SizedBox(),
//     Status.complete => Padding(
//       padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
//       child: TextFormField(
//         controller: _c.resultController,
//         maxLines: null,
//         onTapOutside: (e) => FocusScope.of(context).unfocus(),
//         decoration: const InputDecoration(
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10)))),
//       ),
//     ),
//     Status.loading => const Align(child: CustomLoading())
//
//   };
// }
