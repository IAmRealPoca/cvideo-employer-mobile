import 'package:equatable/equatable.dart';

abstract class SCR002LangDropdownEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SCR002LangDropdownEventStart extends SCR002LangDropdownEvent {}

class SCR002LangDropdownEventChange extends SCR002LangDropdownEvent {
  final String lang;

  SCR002LangDropdownEventChange({this.lang});

  @override
  List<Object> get props => [this.lang];
}