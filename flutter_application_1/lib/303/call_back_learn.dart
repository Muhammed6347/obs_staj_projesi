import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/widget/button/answer_button.dart';
import 'package:flutter_application_1/product/widget/button/loading_button.dart';
import 'package:flutter_application_1/product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallbackDropdown(
            onUserSelected: (CallbackUser user) {
              print(user);
            },
          ),
          AnswerButton(
            onNumber: (number) {
              return number % 3 == 1;
            },
          ),
          LoadingButton(
            title: 'save',
            onPressed: () async {
              await Future.delayed(Duration(seconds: 1));
            },
          ),
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final String id;

  CallbackUser(this.name, this.id);
  // TODO: Dummy Remove It
  static List<CallbackUser> dummyUsers() {
    return [CallbackUser('vb', '123'), CallbackUser('vb2', '124')];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallbackUser && other.name == name && other.id == id;
  }
}
