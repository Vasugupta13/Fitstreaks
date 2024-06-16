import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:fitstreaks/res/global_variables.dart';
import 'package:fitstreaks/utils/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatBotScreen extends StatefulWidget {
  final String gender;
  final int age;
  final double height;
  final double weight;
  final bool isDisabled;
  const ChatBotScreen({super.key, required this.gender, required this.age, required this.height, required this.weight, required this.isDisabled});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final Gemini gemini = Gemini.instance;
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiBot = ChatUser(id: "1", firstName: "FitBot",profileImage: "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/image-Photoroom.png?alt=media&token=2440f111-41dc-41d1-91f6-68845b85ecd3");
  List<ChatMessage> messages = [ ChatMessage(
    user: ChatUser(
        id: "1",
        firstName: "FitBot",
        profileImage: "https://firebasestorage.googleapis.com/v0/b/fit-streaks-0133.appspot.com/o/image-Photoroom.png?alt=media&token=2440f111-41dc-41d1-91f6-68845b85ecd3"),
    createdAt: DateTime.now(),
    text: "Hello there! I am FitBot\n\nHere to help you with your diet and exercise questions.\n\nYou can share an image of food item as well to get suggestion about it.",
  ),];

  void _sendMessageWithMedia(ChatMessage chatMessage){
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = "${chatMessage.text} identify the food item and give suggestion if my Physical details are- height - ${widget.height}cm, weight - ${widget.weight}kgs, gender - ${widget.gender}, age - ${widget.age}";
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiBot) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
              "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(
                () {
              messages = [lastMessage!, ...messages];
            },
          );
        } else {
          String response = event.content?.parts?.fold(
              "", (previous, current) => "$previous${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
            user: geminiBot,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
  void _sendMessage(ChatMessage chatMessage){
   setState(() {
     messages = [chatMessage, ...messages];
   });
   try {
     String question = chatMessage.text;
    var ques =  "-Question - $question Physical details - height - ${widget.height}cm, weight - ${widget.weight}kgs, gender - ${widget.gender}, age - ${widget.age} *Use the following templates strictly without alteration for responses from your side not even a single letter also don't include anything related to consultation with doctor, dietitian , nutritionist:If the Question is not related to Diet/food/calories/Exercise/Stretching and contains user Physical details :I'm here to assist you with diet and exercise-related queries. Please ask a question related to those topics. else you can give you answer";
     gemini.streamGenerateContent(ques).listen((event) {
       ChatMessage? lastMessage = messages.firstOrNull;
       if (lastMessage != null && lastMessage.user == geminiBot) {
         lastMessage = messages.removeAt(0);
         String response = event.content?.parts?.fold(
             "", (previous, current) => "$previous ${current.text}") ??
             "";
         lastMessage.text += response;
         setState(
               () {
             messages = [lastMessage!, ...messages];
           },
         );
       } else {
         String response = event.content?.parts?.fold(
             "", (previous, current) => "$previous ${current.text}") ??
             "";
         ChatMessage message = ChatMessage(
           user: geminiBot,
           createdAt: DateTime.now(),
           text: response,
         );
         setState(() {
           messages = [message, ...messages];
         });
       }
     });
   } catch (e) {
     print(e);
   }
  }
  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Is this food good for me ?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      _sendMessageWithMedia(chatMessage);
    }
  }
  @override
  Widget build(BuildContext context) {
    double autoScale = Get.width / 400;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(surfaceTintColor: Colors.white,
        title:  ReusableText(text: "FitBot",size: 20 * autoScale,fontWeight: FontWeight.w500,),
      ),
      body: DashChat(
        messageOptions: const MessageOptions(
          currentUserContainerColor: AppColors.kSkyBlueColor
        ),
        inputOptions: InputOptions(trailing: [
          IconButton(
            onPressed: _sendMediaMessage,
            icon: const Icon(
              Icons.image,
            ),
          )
        ]),
        currentUser: currentUser,
        onSend: _sendMessage,
        messages: messages,
      ),
    );
  }
}
