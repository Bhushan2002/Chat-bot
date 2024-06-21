import 'package:ai_project/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

import '../model/message.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});
  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}
class _ChatBotFeatureState extends State<ChatBotFeature> {
  TextEditingController _userInput =TextEditingController();
  static const apiKey = GeminiAPIKey;
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  final List<Message> _messages = [];
  Future<void> sendMessage() async{
    final message = _userInput.text;
    setState(() {
      _messages.add(Message(isUser: true, message: message, date: DateTime.now()));
    });
    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    setState(() {
      _messages.add(Message(isUser: false, message: response.text?? "", date: DateTime.now()));
      _userInput.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Chatbot"),centerTitle: true,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          //text input field
          Expanded(
              child: TextFormField(
                controller: _userInput,
                textAlign: TextAlign.center,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    filled: true,
                    isDense: true,
                    hintText: 'Ask me anything you want...',
                    hintStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)))),
              )),

          //for adding some space
          const SizedBox(width: 8),

          //send button
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blueAccent,
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(Icons.send_sharp,
                  color: Colors.white, size: 25),
            ),
          )
        ]),
      ),

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: ListView.builder(itemCount:_messages.length,itemBuilder: (context,index){
                    final message = _messages[index];
                    return Messages(isUser: message.isUser, message: message.message, date: DateFormat('HH:mm').format(message.date));
                  })
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                // child: Row(
                //   children: [
                //     Expanded(
                //       flex: 15,
                //       child: TextFormField(
                //         style: TextStyle(color: Colors.white),
                //         controller: _userInput,
                //         decoration: InputDecoration(
                //             border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(15),
                //             ),
                //             label: Text('Enter Your Message')
                //         ),
                //       ),
                //     ),
                //     Spacer(),
                //     IconButton(
                //         padding: EdgeInsets.all(12),
                //         iconSize: 30,
                //         style: ButtonStyle(
                //             backgroundColor: MaterialStateProperty.all(Colors.black),
                //             foregroundColor: MaterialStateProperty.all(Colors.white),
                //             shape: MaterialStateProperty.all(CircleBorder())
                //         ),
                //         onPressed: (){
                //           sendMessage();
                //         },
                //         icon: Icon(Icons.send))
                //   ],
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}