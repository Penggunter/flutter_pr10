import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/message.dart';

class ChatState extends Equatable {
  final List<Message> messages;

  const ChatState({required this.messages});

  @override
  List<Object> get props => [messages];
}