import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/message.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState(messages: [])) {
    on<SendMessage>((event, emit) {
      final updatedMessages = List<Message>.from(state.messages)
        ..add(Message(sender: event.sender, text: event.text));
      emit(ChatState(messages: updatedMessages));
    });
  }
}
