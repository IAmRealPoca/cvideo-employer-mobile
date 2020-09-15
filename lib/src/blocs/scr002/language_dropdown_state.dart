import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SCR002LangDropdownState extends Equatable {
  final String lang;

  SCR002LangDropdownState({@required this.lang});

  @override
  List<Object> get props => [this.lang];
}

