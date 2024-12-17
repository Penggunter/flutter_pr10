import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessage extends ChatEvent {
  final String sender;
  final String text;

  const SendMessage({required this.sender, required this.text});

  @override
  List<Object> get props => [sender, text];
}