import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'chat/bloc/chat_bloc.dart';
import 'chat/views/chat_page.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pr10',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => ChatBloc(),
        child: const ChatPage(),
      ),
    );
  }
}
