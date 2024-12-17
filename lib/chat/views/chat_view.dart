import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../bloc/chat_state.dart';
import '../bloc/chat_event.dart';
import '../models/message.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  final Message message = state.messages[index];
                  return ListTile(
                    title: Text(message.text),
                    subtitle: Text('От: ${message.sender}'),
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(hintText: 'Введите сообщение...'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    context.read<ChatBloc>().add(
                          SendMessage(sender: 'User', text: _controller.text),
                        );
                    _controller.clear();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
